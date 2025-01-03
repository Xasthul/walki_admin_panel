import 'package:mobx/mobx.dart';
import 'package:walki_admin_panel/home/utils/use_case/home_use_case.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase({
    required HomeUseCase homeUseCase,
  }) : _homeUseCase = homeUseCase;

  final HomeUseCase _homeUseCase;

  @readonly
  bool _isLoggedOutSuccessfully = false;

  Future<void> logout() async {
    try {
      await _homeUseCase.logout();
      _isLoggedOutSuccessfully = true;
    } catch (error) {
      //
    }
  }
}
