import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_store/util/constants.dart';
import '../../model/directions_model.dart';
import 'directions.dart'; // Assuming this is where your Directions class is defined

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': google_api_key,
        },
      );

      if (response.statusCode == 200) {
        return Directions.fromMap(response.data);
      } else {
        throw Exception('Failed to load directions');
      }
    } catch (e) {
      // You can handle different exceptions differently if needed
      print(e.toString());
      return null;
    }
  }
}
