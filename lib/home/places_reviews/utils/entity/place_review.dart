import 'package:equatable/equatable.dart';

class PlaceReview extends Equatable {
  const PlaceReview({
    required this.placeName,
    required this.authorName,
    required this.content,
    required this.createdAt,
  });

  final String placeName;
  final String authorName;
  final String content;
  final DateTime createdAt;

  @override
  List<Object> get props => [
        placeName,
        authorName,
        content,
        createdAt,
      ];
}
