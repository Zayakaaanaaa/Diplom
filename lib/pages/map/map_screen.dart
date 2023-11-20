// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:grocery_store/util/constants.dart';
// import 'package:location/location.dart';
// import 'package:sizer/sizer.dart';

// import '../../model/store_sector.dart';
// import '../../services/grocery.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final Completer<GoogleMapController> _controller = Completer();
//   final List<StoreSector> sectors = GroceryModel.getStoreSector(1);

//   LatLng sourceLocation = LatLng(47.9203, 106.8199);
//   List<LatLng> polylineCoordinates = [];
//   LocationData? currentLoaction;
//   StoreSector? selectedSector;

//   BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

//   void getCurrentLocation() async {
//     Location location = Location();

//     location.getLocation().then(
//           (location) => currentLoaction = location,
//         );

//     GoogleMapController googleMapController = await _controller.future;

//     // location.onLocationChanged.listen(
//     //   (event) {
//     //     currentLoaction = event;

//     //     googleMapController.animateCamera(
//     //       CameraUpdate.newCameraPosition(
//     //         CameraPosition(
//     //           zoom: 13.5,
//     //           target: LatLng(
//     //             event.latitude!,
//     //             event.longitude!,
//     //           ),
//     //         ),
//     //       ),
//     //     );

//     //     setState(() {});
//     //   },
//     // );
//   }

//   Future<void> _goToSelectedSector() async {
//     final GoogleMapController controller = await _controller.future;
//     if (selectedSector != null) {
//       controller.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: selectedSector!.sectorLng,
//             zoom: 15.0,
//           ),
//         ),
//       );
//     }
//   }

//   void onSelectSector(StoreSector sector) {
//     setState(() {
//       selectedSector = sector;
//     });
//     _goToSelectedSector();
//     getPolyPoints(); // Redraw polyline for the new selection
//   }

  // Set<Marker> buildMarkers() {
  //   var markers = <Marker>{
  //     // Marker(
  //     //   markerId: MarkerId('current'),
  //     //   position:
  //     // ),
  //     Marker(
  //       markerId: MarkerId("current"),
  //       // icon: customIconWidget(),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(
  //         BitmapDescriptor.hueOrange,
  //       ),
  //       position:
  //           LatLng(currentLoaction!.latitude!, currentLoaction!.longitude!),
  //     ),
  //     if (sourceLocation != null)
  //       Marker(
  //         markerId: MarkerId("source"),
  //         position: sourceLocation,
  //       ),
  //   };

  //   for (var sector in sectors) {
  //     markers.add(
  //       Marker(
  //         markerId: MarkerId(sector.sectorName),
  //         position: sector.sectorLng,
  //         icon: BitmapDescriptor.defaultMarkerWithHue(
  //           BitmapDescriptor.hueBlue,
  //         ),
  //       ),
  //     );
  //   }

  //   return markers;
  // }

//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();

//     PointLatLng startPoint = PointLatLng(
//       sourceLocation.latitude,
//       sourceLocation.longitude,
//     );

//     PointLatLng endPoint = selectedSector == null
//         ? PointLatLng(
//             sectors[0].sectorLng.latitude,
//             sectors[0].sectorLng.longitude,
//           )
//         : PointLatLng(
//             selectedSector!.sectorLng.latitude,
//             selectedSector!.sectorLng.longitude,
//           );

//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       google_api_key,
//       startPoint,
//       endPoint,
//     );

//     if (result.points.isNotEmpty) {
//       polylineCoordinates.clear(); // Clear existing coordinates
//       result.points.forEach((element) {
//         polylineCoordinates.add(
//           LatLng(element.latitude, element.longitude),
//         );
//       });
//       setState(() {});
//     }
//   }

//   void setCustomMarkerIcon() {
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, "assets/stores/profile.webp")
//         .then((icon) {
//       currentIcon = icon;
//     });
//   }

//   Widget customIconWidget() {
//     return FutureBuilder<BitmapDescriptor>(
//       future: BitmapDescriptor.fromAssetImage(
//           ImageConfiguration.empty, "assets/stores/profile.webp"),
//       builder:
//           (BuildContext context, AsyncSnapshot<BitmapDescriptor> snapshot) {
//         if (snapshot.hasData) {
//           return Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: Colors.blue, // Border color
//                 width: 2, // Border width
//               ),
//             ),
//             child: ClipOval(
//               child: Image.asset("assets/stores/profile.webp"),
//             ),
//           );
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     customIconWidget();
//     // setCustomMarkerIcon();
//     getCurrentLocation();
//     getPolyPoints();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentLoaction == null
//           ? Center(
//               child: Text("Loading"),
//             )
//           : GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(
//                     currentLoaction!.latitude!, currentLoaction!.longitude!),
//                 zoom: 14.5,
//               ),
//               polylines: {
//                 Polyline(
//                   polylineId: PolylineId("route"),
//                   points: polylineCoordinates,
//                   color: kPrimaryColor,
//                   width: 6,
//                 )
//               },
//               markers: buildMarkers(),
//               onMapCreated: (controller) {
//                 _controller.complete(controller);
//               },
//             ),
//     );
//   }
// }

// // import 'dart:async';
// // import 'dart:math';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:grocery_store/model/store_sector.dart';
// // import 'package:grocery_store/services/grocery.dart';
// // import 'package:grocery_store/util/constants.dart';
// // import 'package:location/location.dart';

// // class MapScreen extends StatefulWidget {
// //   const MapScreen({super.key});

// //   @override
// //   State<MapScreen> createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   final Completer<GoogleMapController> _controller = Completer();
// //   late LatLng sourceLocation;
// //   LatLng myLocation = LatLng(47.9203, 106.8199);
// //   final List<StoreSector> sectors = GroceryModel.getStoreSector(1);
// //   StoreSector? selectedSector;
// //   List<LatLng> polylineCoordinates = [];

// //   Future<void> _getCurrentLocation() async {
// //     Location location = Location();
// //     LocationData locationData = await location.getLocation();
// //     setState(() {
// //       myLocation = LatLng(locationData.latitude!, locationData.longitude!);
// //     });
// //   }

// //   Future<void> _goToSelectedSector() async {
// //     final GoogleMapController controller = await _controller.future;
// //     if (selectedSector != null) {
// //       controller.animateCamera(
// //         CameraUpdate.newCameraPosition(
// //           CameraPosition(
// //             target: selectedSector!.sectorLng,
// //             zoom: 15.0,
// //           ),
// //         ),
// //       );
// //     }
// //   }

// //   void getPolyPoints() async {
// //     PolylinePoints polylinePoints = PolylinePoints();

// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       google_api_key,
// //       PointLatLng(myLocation.latitude, myLocation.longitude),
// //       PointLatLng(selectedSector!.sectorLng.latitude,
// //           selectedSector!.sectorLng.longitude),
// //     );

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach(
// //         (PointLatLng point) => polylineCoordinates.add(
// //           LatLng(point.latitude, point.longitude),
// //         ),
// //       );
// //       setState(() {});
// //     }
// //   }

// //   void onSelectSector(StoreSector sector) {
// //     setState(() {
// //       selectedSector = sector;
// //     });

// //     print('----------------------------');
// //     print(selectedSector);
// //     _goToSelectedSector();
// //     getPolyPoints();
// //   }

// //   Set<Marker> _buildMarkers() {
// //     var markers = <Marker>{
// //       if (myLocation != null)
// //         Marker(
// //           markerId: MarkerId("source"),
// //           position: myLocation,
// //         ),
// //     };

// //     for (var sector in sectors) {
// //       markers.add(
// //         Marker(
// //           markerId: MarkerId(sector.sectorName),
// //           position: sector.sectorLng,
// //           icon: BitmapDescriptor.defaultMarkerWithHue(
// //             BitmapDescriptor.hueBlue,
// //           ),
// //         ),
// //       );
// //     }

// //     return markers;
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     getPolyPoints();
// //     _getCurrentLocation();

// //     print('----------------------------');
// //     print(selectedSector);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: myLocation == null
// //           ? Text('Loading...')
// //           : GoogleMap(
// //               myLocationEnabled: false,
// //               initialCameraPosition: CameraPosition(
// //                 target: myLocation,
// //                 zoom: 13,
// //               ),
// //               polylines: {
// //                 Polyline(
// //                   polylineId: PolylineId("route"),
// //                   points: polylineCoordinates,
// //                 )
// //               },
// //               markers: _buildMarkers(),
// //             ),
// //     );
// //   }
// // }
