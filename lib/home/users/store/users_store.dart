import 'package:mobx/mobx.dart';
import 'package:walki_admin_panel/home/utils/entity/user.dart';

part 'users_store.g.dart';

class UsersStore = UsersStoreBase with _$UsersStore;

abstract class UsersStoreBase with Store {
  ObservableList<User> users = ObservableList.of([]);
  @readonly
  int? _sortColumnIndex;
  @readonly
  bool _sortAscending = true;
  @readonly
  bool _sortNameAscending = true;
  @readonly
  bool _sortEmailAscending = true;
  @readonly
  bool _sortPlacesVisitedAscending = true;
  @readonly
  bool _sortReviewsWrittenAscending = true;
  @readonly
  bool _isLoading = false;

  @action
  void load() {
    _isLoading = true;
    final List<User> loadedUsers = [
      const User(
        email: 'email@email.com',
        name: 'Nazarii',
        placesVisited: 3,
        reviewsWritten: 1,
      ),
      const User(
        email: 'andrew@email.com',
        name: 'Andrew',
        placesVisited: 5,
        reviewsWritten: 3,
      ),
    ];
    users = ObservableList.of(loadedUsers);
    _isLoading = false;
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
      (a, b) => sortAscending //
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
      (a, b) => sortAscending //
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
      (a, b) => sortAscending //
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
      (a, b) => sortAscending //
          ? b.reviewsWritten.compareTo(a.reviewsWritten)
          : a.reviewsWritten.compareTo(b.reviewsWritten),
    );
  }
}
