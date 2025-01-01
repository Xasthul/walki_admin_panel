import 'package:mobx/mobx.dart';
import 'package:walki_admin_panel/home/users/utils/use_case/users_use_case.dart';
import 'package:walki_admin_panel/home/utils/entity/user.dart';

part 'users_store.g.dart';

class UsersStore = UsersStoreBase with _$UsersStore;

abstract class UsersStoreBase with Store {
  UsersStoreBase({
    required UsersUseCase usersUseCase,
  }) : _usersUseCase = usersUseCase;

  final UsersUseCase _usersUseCase;

  ObservableList<User> users = ObservableList.of([]);
  ObservableList<User> selectedUsers = ObservableList.of([]);
  @readonly
  int? _sortColumnIndex;
  @readonly
  bool _sortAscending = true;
  @readonly
  bool _isLoading = false;

  bool _sortNameAscending = true;
  bool _sortEmailAscending = true;
  bool _sortPlacesVisitedAscending = true;
  bool _sortReviewsWrittenAscending = true;

  @action
  Future<void> load() async {
    _isLoading = true;
    try {
      final loadedUsers = await _usersUseCase.getUsers();
      users = ObservableList.of(loadedUsers);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void onEmailSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortEmailAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortEmailAscending;
    }
    users.sort(
      (a, b) => _sortAscending //
          ? a.email.compareTo(b.email)
          : b.email.compareTo(a.email),
    );
  }

  @action
  void onNameSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortNameAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortNameAscending;
    }
    users.sort(
      (a, b) => _sortAscending //
          ? a.name.compareTo(b.name)
          : b.name.compareTo(a.name),
    );
  }

  @action
  void onPlacesVisitedSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortPlacesVisitedAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortPlacesVisitedAscending;
    }
    users.sort(
      (a, b) => _sortAscending //
          ? b.placesVisited.compareTo(a.placesVisited)
          : a.placesVisited.compareTo(b.placesVisited),
    );
  }

  @action
  void onReviewsWrittenSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortReviewsWrittenAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortReviewsWrittenAscending;
    }
    users.sort(
      (a, b) => _sortAscending //
          ? b.reviewsWritten.compareTo(a.reviewsWritten)
          : a.reviewsWritten.compareTo(b.reviewsWritten),
    );
  }

  @action
  void onUserSelected({
    required User user,
    required bool? isSelected,
  }) {
    if (isSelected == null) {
      return;
    }
    if (isSelected) {
      selectedUsers.add(user);
      return;
    }
    selectedUsers.remove(user);
  }
}
