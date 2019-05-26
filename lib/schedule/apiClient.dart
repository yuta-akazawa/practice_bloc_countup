import 'dart:async';
import 'dart:convert';

import 'package:practice_bloc_cpuntup/schedule/scheduleModel.dart';
import 'package:http/http.dart';

class ScheduleClient {
  final client = Client();
  
  Future<List<scheduleModel>> getItems() async {
    final result = await client.get('https://firebasestorage.googleapis.com/v0/b/blog-1a47d.appspot.com/o/json%2FscheduleJson.json?alt=media&token=565f8ef4-c0c6-41b2-bfd5-9b40b881b272');
    final json = (await jsonDecode(result.body)) as List<dynamic>;
    final list = json.map((j) => scheduleModel.fromJson(j as Map<String, dynamic>)).toList();

    return list;
  }
}