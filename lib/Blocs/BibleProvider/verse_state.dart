import 'Verse.dart';
import 'package:equatable/equatable.dart';


abstract class VerseState extends Equatable {
 const VerseState();

 @override
 List<Object> get props => [];
}

class VerseUnintialized extends VerseState {}

class VerseInitial extends VerseState {}

class VerseLoading extends VerseState {}

// Only the VerseLoaded event needs to contain data
class VerseLoaded extends VerseState {
  final List<Verse> verses;
  //final bool hasReachedEnd;
  final int chapterNum;

  const VerseLoaded({
    this.verses,
    //this.hasReachedEnd,
    this.chapterNum
  });

  VerseLoaded copyWith({
    List<Verse> verses,
    bool hasReachedEnd,
    int chapterNum
  }) {
    return VerseLoaded(
      verses: verses ?? this.verses,
      //hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      chapterNum: chapterNum ?? this.chapterNum
    );
  }

  @override
  List<Object> get props => [/*hasReachedEnd,*/ chapterNum];

  @override
  String toString() => 'VerseLoaded { verses: ${verses.length}';
  
}