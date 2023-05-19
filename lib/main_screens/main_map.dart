import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:best_friend/appBar/BFAppBar.dart';
//https://kitty-geno.tistory.com/46

// api key: AIzaSyA04oH39Z3v8rLICxwxzTjamHEiMA8f5jU

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final String apiKey = 'AIzaSyA04oH39Z3v8rLICxwxzTjamHEiMA8f5jU';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BFAppBar(
        appBarFunction: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SizedBox(
            width: 620,
            height: 850,
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://maps.google.com/maps?key=$apiKey'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//  GoogleMapController? _controller;
//   LocationData? _currentLocation;

//   @override
//   void initState() {
//     super.initState();
//     _initializeLocation();
//   }

//   void _initializeLocation() async {
//     Location location  = Location();

//     bool serviceEnabled;
//     PermissionStatus permissionGranted;

//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }

//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     _currentLocation = await location.getLocation();

//     setState(() {
//       // Update the map with the current location
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BFAppBar(
//         appBarFunction: 3,
//       ),
//       body: _currentLocation != null
//           ? GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(
//                   _currentLocation!.latitude ?? 0.0,
//                   _currentLocation!.longitude ?? 0.0,
//                 ),
//                 zoom: 14.0,
//               ),
//               onMapCreated: (GoogleMapController controller) {
//                 _controller = controller;
//               },
//             )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
// }
