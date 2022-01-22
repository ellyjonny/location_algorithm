import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:location_algorithm/models/place.dart';

class PlacesService {
  final key = 'YOUR_API_KEY';
  static String place = 'ATM';
  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$place&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
