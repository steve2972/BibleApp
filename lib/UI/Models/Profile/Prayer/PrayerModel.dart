class PrayerModel {
  int id;
  String content;
  PrayerModel(this.content, {this.id});

  PrayerModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.content = map['content'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      '_id': this.id,
      'content': this.content
    };
  }
}