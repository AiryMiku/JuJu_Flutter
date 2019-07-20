
class Group {
  int id;
  int ownerUserId;
  String name;
  String notice;
  String introduction;
  String createTime;
  bool isFollow = false;  // nullable

  Group(this.id, this.ownerUserId, this.name, this.notice, this.introduction, this.createTime, this.isFollow);

  Group.fromJson(Map<String, dynamic> json):
      this.id = json['id'],
      this.ownerUserId = json['owner_user_id'],
      this.name = json['name'],
      this.notice = json['notice'],
      this.introduction = json['introduction'],
      this.createTime = json['create_time'],
      this.isFollow = json['is_follow'];
}