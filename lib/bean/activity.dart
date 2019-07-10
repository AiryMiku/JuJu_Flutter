
class Activity {
  int id;
  String title;
  String content;
  String place;
  String startTime;
  String endTime;
  String likeNumber;
  String groupName;
  bool isFollow;

  Activity(this.id, this.title, this.startTime, this.endTime, this.place);

  Activity.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'],
        this.startTime = json['start_time'],
        this.endTime = json['end_time'],
        this.place = json['place'];
}