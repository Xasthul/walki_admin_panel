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
    final response = await _client.get('$_baseUrl/users');
    final items = (response as Map<String, dynamic>)['items'] as List<dynamic>;
    return items.map((item) => UserResponse.fromJson(item as Map<String, dynamic>)).toList();
  }
}
