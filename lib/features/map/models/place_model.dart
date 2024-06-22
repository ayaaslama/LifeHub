import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;
  PlaceModel({required this.id, required this.name, required this.latLng});
}

List<PlaceModel> places = [
  PlaceModel(
      id: 1,
      name: "بنك الدم المنصورة الشيخ حسنين",
      latLng: LatLng(31.049549756303257, 31.377280768850987)),
  PlaceModel(
      id: 2,
      name: "المركز الاقليمى لنقل الدم وتجميع البلازما بدار السلام",
      latLng: LatLng(30.04372301471302, 31.227612016809697)),
  PlaceModel(
      id: 3,
      name: "بنك الدم المركزى - الهلال الأحمر المصري",
      latLng: LatLng(30.10108500130665, 31.23810062030251)),
  PlaceModel(
      id: 4,
      name: "Greek Hospital Blood Bank",
      latLng: LatLng(30.117678078439337, 31.284792515922227)),
  PlaceModel(
      id: 5,
      name: "المركز القومى لنقل الدم، العجوزة",
      latLng: LatLng(30.092326980622435, 31.21887455820785)),
  PlaceModel(
      id: 6,
      name: "المركز الاقليمى لنقل الدم بشبين الكوم",
      latLng: LatLng(30.59170071882313, 31.00769048907673)),
  PlaceModel(
      id: 7,
      name: "المركز الاقليمى لنقل الدم بطنطا",
      latLng: LatLng(30.799412447806766, 30.987919193871598)),
];
