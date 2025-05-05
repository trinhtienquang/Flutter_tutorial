import 'package:favorite_places/models/places.dart';
import 'package:favorite_places/screens/select_location.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onLocation});

  final void Function(PlaceLocation location) onLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  void _getCurrentLocation() async {
    loc.Location location = loc.Location();

    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;
    loc.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final long = locationData.longitude;
    var address = '';

    if (lat == null || long == null) {
      return;
    }
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    if (placemarks.isNotEmpty) {
      final Placemark place = placemarks[0];
      address =
          '${place.thoroughfare}, ${place.subAdministrativeArea}, ${place.administrativeArea}';
    }

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: long,
        address: address,
      );
      _isGettingLocation = false;
    });

    widget.onLocation(_pickedLocation!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );

    if (_isGettingLocation) {
      previewContent = CircularProgressIndicator();
    }

    if (_pickedLocation != null) {
      final lat = _pickedLocation!.latitude;
      final long = _pickedLocation!.longitude;

      previewContent = FlutterMap(
        options: MapOptions(initialCenter: LatLng(lat, long), initialZoom: 15),
        children: [
          TileLayer(
            urlTemplate: 'http://tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                child: Icon(Icons.location_on, color: Colors.red, size: 30),
                point: LatLng(lat, long),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              label: Text('Get Current Location'),
              icon: Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: () async {
                final selectedLocation = await Navigator.of(
                  context,
                ).push<PlaceLocation>(
                  MaterialPageRoute(builder: (ctx) => const SelectLocation()),
                );

                if (selectedLocation == null) return;

                setState(() {
                  _pickedLocation = selectedLocation;
                });

                widget.onLocation(_pickedLocation!);
              },
              label: Text('Get Current Map'),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
