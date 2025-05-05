import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

import '../models/places.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  LatLng? _selectedLocation;
  String? _address;

  void _onTap(TapPosition tapPosition, LatLng latlng) async {
    setState(() {
      _selectedLocation = latlng;
      _address = null;
    });

    List<Placemark> placemarks = await placemarkFromCoordinates(
      latlng.latitude,
      latlng.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      final address =
          '${place.thoroughfare}, ${place.subAdministrativeArea}, ${place.administrativeArea}';
      setState(() {
        _address = address;
      });
    }
  }

  void _confirmLocation() {
    if (_selectedLocation == null || _address == null) return;

    final location = PlaceLocation(
      latitude: _selectedLocation!.latitude,
      longitude: _selectedLocation!.longitude,
      address: _address!,
    );
    Navigator.of(context).pop(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn vị trí'),
        actions: [
          IconButton(
            onPressed: _selectedLocation == null ? null : _confirmLocation,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(21.0285, 105.8542), // Ví dụ: Hà Nội
          initialZoom: 13,
          onTap: _onTap,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          if (_selectedLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: _selectedLocation!,
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
        ],
      ),
      bottomNavigationBar:
          _address != null
              ? Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _address!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              )
              : null,
    );
  }
}
