import 'package:practice_bloc_cpuntup/schedule/scheduleModel.dart';
import 'package:practice_bloc_cpuntup/schedule/scheduleBloc.dart';
import 'package:practice_bloc_cpuntup/blocProvider.dart';

import 'package:flutter/material.dart';

class ScheduleStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiBloc>(
      bloc: ApiBloc(),
      child: Schedule(),
    );
  }
}

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    final ApiBloc bloc = BlocProvider.of<ApiBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("スケジュール"),
      ),
      body: StreamBuilder<List<scheduleModel>>(
          stream: bloc.outStream,
          builder: (context, snapshot) {
            if (snapshot == null || snapshot.data == null) {
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            return ListView.builder(itemBuilder: (context, position) {
              var item = snapshot.data[position];
              return _listItems(item);
            });
          }),
    );
  }

  Widget _listItems(scheduleModel item) {
    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(item.hour),
        trailing: Text(item.time.toString() + "時間"),
      ),
    );
  }
}