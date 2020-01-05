import 'package:equatable/equatable.dart';

class Verse extends Equatable {
  final int chapter;
  final String text;
  final int id;

  Verse(this.chapter, this.text, this.id);

  @override
  List<Object> get props => [chapter, text, id];

  @override
  String toString() => 'Verse { id: $id }';

  factory Verse.fromMap(Map<String, dynamic> data) {
    return Verse(
      data['ChapterId'],
      data['Text'],
      data['Number']
    );
  }
}