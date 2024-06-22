import 'dart:ffi';
import 'dart:typed_data';

import 'package:blood_life/features/map/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 8, target: LatLng(30.790380837996715, 30.991261896595972));
    initMarkers();
    super.initState();
  }

  Set<Marker> markers = {};
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
          zoomControlsEnabled: false,
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
            initMapStyle();
          },
          initialCameraPosition: initialCameraPosition),
    ]);
  }

  void initMapStyle() async {
    var lightMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/light_map_style.json");
    googleMapController.setMapStyle(lightMapStyle);
  }

  void initMarkers() async {
    var customMarkerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/blood-bank.png");
    var myMarkers = places
        .map(
          (placeModel) => Marker(
            icon: customMarkerIcon,
            infoWindow: InfoWindow(title: placeModel.name),
            position: placeModel.latLng,
            markerId: MarkerId(
              placeModel.id.toString(),
            ),
          ),
        )
        .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }
}
