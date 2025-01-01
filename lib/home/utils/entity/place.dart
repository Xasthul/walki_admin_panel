import 'package:equatable/equatable.dart';

class Place extends Equatable {
  const Place({
    required this.name,
    required this.timesVisited,
    required this.reviewsNumber,
  });

  final String name;
  final int timesVisited;
  final int reviewsNumber;

  @override
  List<Object> get props => [
        name,
        timesVisited,
        reviewsNumber,
      ];
}
