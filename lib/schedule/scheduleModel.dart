class scheduleModel {
  String title;
  int time;
  String tag;
  String hour;

  scheduleModel.fromJson(Map<String, dynamic> json)
  :
        title = json['title'] as String,
        time = json['time'] as int,
        tag = json['tag'] as String,
        hour = json['hour'] as String
  ;


}