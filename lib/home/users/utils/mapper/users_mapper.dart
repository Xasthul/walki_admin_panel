import 'package:walki_admin_panel/home/users/utils/network/user_response.dart';
import 'package:walki_admin_panel/home/utils/entity/user.dart';

class UsersMapper {
  User mapUserFromResponse(UserResponse response) => User(
        email: response.email,
        name: response.name,
        placesVisited: response.placesVisited,
        reviewsWritten: response.reviewsWritten,
      );
}
