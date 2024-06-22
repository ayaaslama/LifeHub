import 'package:bloc/bloc.dart';
import 'package:blood_life/core/models/data_in_helpus.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial());
  List<dynamic> data = [];

  late Crud crud;
  Future<void> fetchData() async {
    try {
      final List<dynamic> dataList =
          await crud.fetchData("$linkServerName/Donation_Request");

      data = dataList.map((data) => DataINRequests.fromJson(data)).toList();

      emit(RequestsLoaded());
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
