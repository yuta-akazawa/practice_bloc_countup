import 'dart:async';
import 'package:practice_bloc_cpuntup/blocProvider.dart';
import 'package:practice_bloc_cpuntup/schedule/apiClient.dart';
import 'package:practice_bloc_cpuntup/schedule/scheduleModel.dart';

class ApiBloc implements BlocBase {
  StreamController<List<scheduleModel>> _scheduleController = StreamController<List<scheduleModel>>();
  StreamSink<List<scheduleModel>> get items => _scheduleController.sink;
  Stream<List<scheduleModel>> get outStream => _scheduleController.stream;

  ApiBloc(){
    _getItems();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scheduleController.close();
  }

  void _getItems() async {
    final itemList = await ScheduleClient().getItems();
    _scheduleController.sink.add(itemList);
  }

}