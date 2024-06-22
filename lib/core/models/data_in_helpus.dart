import 'package:intl/intl.dart';

class DataINRequests {
  late String hospitalCenter;
  late String bloodType;
  late String date;

  final dateFormat = DateFormat('MM/dd/yyyy');

  DataINRequests.fromJson(Map<String, dynamic> json) {
    hospitalCenter = json['hospitalCenter'];
    bloodType = json['bloodType'];
    date = dateFormat.format(dateFormat.parse(json['d']));
  }
}
