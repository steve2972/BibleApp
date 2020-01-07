class GroupModel {
  int id;
  String title;
  String people;
  bool isPinned;

  GroupModel(this.title, this.people, {this.id,this.isPinned});

  GroupModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.title = map['title'];
    this.people = map['peopleList'];
    //this.date = DateTime.parse(map['date']);
    //this.meetingTime = DateTime.parse(map['meetingTime']);
    this.isPinned = map['isPinned'] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      '_id': this.id,
      'title': this.title,
      'peopleList' : this.people,
      //'date' : this.date.toIso8601String(),
      //'meetingTime': this.meetingTime.toIso8601String(),
      'isPinned': this.isPinned == true ? 1 : 0
    };
  }
}