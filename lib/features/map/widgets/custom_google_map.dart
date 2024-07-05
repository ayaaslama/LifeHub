import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/routing/routes.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({Key? key}) : super(key: key);

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController googleMapController;
  late CameraPosition initialCameraPosition;
  List<dynamic> _data = [];
  Set<Marker> markers = {};
  late Crud _crud;

  @override
  void initState() {
    super.initState();
    _crud = Crud();
    initialCameraPosition = const CameraPosition(
      zoom: 8.5,
      target: LatLng(30.790380837996715, 30.991261896595972),
    );
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<dynamic> dataList = await _crud.fetchData(
          "https://cb4d-197-43-101-128.ngrok-free.app/centerCharacters");
      setState(() {
        _data = dataList;
        initMarkers();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: (controller) {
            googleMapController = controller;
            initMapStyle();
          },
          initialCameraPosition: initialCameraPosition,
          markers: markers,
        ),
      ],
    );
  }

  void initMapStyle() async {
    var lightMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/light_map_style.json");
    googleMapController.setMapStyle(lightMapStyle);
  }

  void initMarkers() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(42, 42)),
      'assets/images/blood-bank(1).png',
    ).then((BitmapDescriptor customMarkerIcon) {
      Set<Marker> myMarkers = _data
          .map((item) => Marker(
                markerId: MarkerId(item['id'].toString()),
                position: LatLng(item['longitude'], item['latitude']),
                infoWindow: InfoWindow(
                  title: item['fullName'],
                  snippet: 'Tap to Book',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: ManagerColor.white,
                          title: const Text(
                            'Book',
                            style: TextStyle(
                                color: ManagerColor.maink7ly,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'Do you want to book ${item['fullName']}?',
                            style:
                                const TextStyle(color: ManagerColor.maink7ly),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: ManagerColor.mainred),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'Book',
                                style: TextStyle(color: ManagerColor.mainred),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.questionare);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                icon: customMarkerIcon,
              ))
          .toSet();

      setState(() {
        markers = myMarkers;
      });
    });
  }
}
