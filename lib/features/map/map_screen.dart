import 'package:blood_life/features/map/widgets/custom_google_map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MapScreen());
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location Picker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CustomGoogleMap());
  }
}
