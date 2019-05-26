import 'dart:async';
import 'package:practice_bloc_cpuntup/minimum/bloc.dart';
import 'package:practice_bloc_cpuntup/blocProvider.dart';

import 'package:flutter/material.dart';

class MinimumStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IncrementBloc>(
      bloc:IncrementBloc(),
      child:Minimum(),
    );
  }
}

class Minimum extends StatefulWidget {
  @override
  _MinimumState createState() => new _MinimumState();
}

class _MinimumState extends State<Minimum> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('最小のBloc'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.outCounter,
            initialData: counter,
            builder:(context, snapshot){
              return Text('${snapshot.data}');
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            bloc.incrementCounter.add(counter);
          }
      ),
    );
  }
}