import 'package:favorite_places/models/places.dart';
import 'package:favorite_places/screens/view_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DetailPlacesScreen extends StatelessWidget {
  const DetailPlacesScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    final lat = place.location.latitude;
    final long = place.location.longitude;
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (ctx) => ViewLocationScreen(
                              latitude: lat,
                              longitude: long,
                            ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                      child: SizedBox(
                        width: 140, // bằng 2 * radius
                        height: 140,
                        child: AbsorbPointer(
                          absorbing: true,
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(lat, long),
                              initialZoom: 15,
                              interactionOptions: const InteractionOptions(
                                flags: InteractiveFlag.none, // Tắt zoom/pan
                              ),
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'http://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: const ['a', 'b', 'c'],
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    point: LatLng(lat, long),
                                    width: 30,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    place.location.address,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
