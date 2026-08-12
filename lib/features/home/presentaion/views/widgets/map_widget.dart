
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initCameraPostion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }

  void initCameraPostion() {
    initialCameraPosition = CameraPosition(
      target: LatLng(35.8719194950537, 37.428630225365445),
      zoom: 2,
    );
  }
}
