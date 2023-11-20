import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/directions_model.dart';
import '../../model/store_sector.dart';
import 'directions.dart';
import '../../services/grocery.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng sourceLocation = LatLng(47.9203, 106.8199);
  late GoogleMapController _googleMapController;
  final List<StoreSector> sectors = GroceryModel.getStoreSector(1);
  StoreSector? _selectedSector; // Variable for the selected sector
  Set<Polyline> _polylines = Set(); // Polylines to be displayed on the map

  Set<Marker> buildMarkers() {
    var markers = <Marker>{
      Marker(
        markerId: MarkerId("current"),
        // icon: customIconWidget(),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ),
        position: LatLng(sourceLocation.latitude, sourceLocation.longitude),
      ),
    };

    for (var sector in sectors) {
      markers.add(
        Marker(
          markerId: MarkerId(sector.sectorName),
          infoWindow: InfoWindow(title: sector.sectorName),
          position: sector.sectorLng,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onTap: () => _onSectorTap(sector), // Handle sector selection
        ),
      );
    }

    return markers;
  }

  void _onSectorTap(StoreSector sector) {
    setState(() {
      _selectedSector = sector;
      _polylines.clear();
      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        points: [sourceLocation, sector.sectorLng],
        color: Colors.red,
        width: 5,
      ));
      // Update camera position
      _googleMapController
          .animateCamera(CameraUpdate.newLatLng(sector.sectorLng));
    });
    print(_selectedSector!.sectorLng);
  }

  @override
  void initState() {
    super.initState();
    // Initialize other state properties if needed
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            sourceLocation.latitude,
            sourceLocation.longitude,
          ),
          zoom: 14.5,
        ),
        onMapCreated: (controller) {
          _googleMapController = controller;
        },
        markers: buildMarkers(),
        polylines: _polylines, // Add the polylines to the map
      ),
    );
  }
}
