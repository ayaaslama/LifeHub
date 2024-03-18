import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 60,
            left: 0,
            right: 0.0,
            child: Image.asset(
              'assets/images/Frame 4.png',
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
