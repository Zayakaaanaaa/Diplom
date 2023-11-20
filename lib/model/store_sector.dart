import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreSector {
  final int sectorId;
  final String sectorName;
  final LatLng sectorLng;

  StoreSector({
    required this.sectorId,
    required this.sectorLng,
    required this.sectorName,
  });
}
