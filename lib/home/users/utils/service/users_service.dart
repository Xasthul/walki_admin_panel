import 'package:walki_admin_panel/app/utils/entity/app_constants.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client.dart';
import 'package:walki_admin_panel/home/users/utils/network/user_response.dart';

class UsersService {
  UsersService({
    required AuthorizedDioClient client,
  }) : _client = client;

  final AuthorizedDioClient _client;

  static const _baseUrl = '${AppConstants.serviceBaseUrl}/admin';

  Future<List<UserResponse>> getUsers() async {
    return [
      UserResponse(
        'email1@email.com',
        'Nazarii',
        1,
        3,
      ),
      UserResponse(
        'email2@email.com',
        'Andrew',
        11,
        5,
      ),
      UserResponse(
        'email3@email.com',
        'Rafael',
        6,
        8,
      ),
    ];
    final response = await _client.get('$_baseUrl/users');
    final items = (response as Map<String, dynamic>)['items'] as List<dynamic>;
    return items.map((item) => UserResponse.fromJson(item as Map<String, dynamic>)).toList();
  }
}
