import 'package:walki_admin_panel/app/utils/storage/local_storage.dart';

class HomeUseCase {
  HomeUseCase({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  Future<void> logout() => _localStorage.clearAccessToken();
}
