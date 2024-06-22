import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/features/home/ui/widgets/donation_request.dart';
import 'package:flutter/material.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  List<dynamic> _data = [];

  late Crud _crud;

  @override
  void initState() {
    super.initState();
    _crud = Crud();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<dynamic> dataList =
          await _crud.fetchData("$linkServerName/Donation_Request");
      setState(() {
        _data = dataList;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: DonationRequest(
              length: _data.length,
            )));
  }
}
