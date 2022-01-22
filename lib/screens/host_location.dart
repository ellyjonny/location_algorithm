import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_algorithm/models/place.dart';
import 'package:location_algorithm/screens/search.dart';
import 'package:location_algorithm/services/geolocator_service.dart';
import 'package:location_algorithm/services/places_service.dart';
import 'package:provider/provider.dart';

class HostLocation extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return (position != null)
                ? placesService.getPlaces(position.latitude, position.longitude)
                : null;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Area Location',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.greenAccent,
          ),
          body: Search(),
        ),
      ),
    );
  }
}
