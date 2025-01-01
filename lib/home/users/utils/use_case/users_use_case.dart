import 'package:walki_admin_panel/home/users/utils/mapper/users_mapper.dart';
import 'package:walki_admin_panel/home/users/utils/service/users_service.dart';
import 'package:walki_admin_panel/home/utils/entity/user.dart';

class UsersUseCase {
  UsersUseCase({
    required UsersService usersService,
    required UsersMapper usersMapper,
  })  : _usersService = usersService,
        _usersMapper = usersMapper;

  final UsersService _usersService;
  final UsersMapper _usersMapper;

  Future<List<User>> getUsers() async {
    final users = await _usersService.getUsers();
    return users.map(_usersMapper.mapUserFromResponse).toList();
  }
}
