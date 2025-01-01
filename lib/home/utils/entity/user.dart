import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.email,
    required this.name,
    required this.placesVisited,
    required this.reviewsWritten,
  });

  final String email;
  final String name;
  final int placesVisited;
  final int reviewsWritten;

  @override
  List<Object> get props => [
        email,
        name,
        placesVisited,
        reviewsWritten,
      ];
}
