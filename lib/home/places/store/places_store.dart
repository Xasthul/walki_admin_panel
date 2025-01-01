import 'package:mobx/mobx.dart';
import 'package:walki_admin_panel/home/places/utils/use_case/places_use_case.dart';
import 'package:walki_admin_panel/home/utils/entity/place.dart';

part 'places_store.g.dart';

class PlacesStore = PlacesStoreBase with _$PlacesStore;

abstract class PlacesStoreBase with Store {
  PlacesStoreBase({
    required PlacesUseCase placesUseCase,
  }) : _placesUseCase = placesUseCase;

  final PlacesUseCase _placesUseCase;

  ObservableList<Place> places = ObservableList.of([]);
  ObservableList<Place> selectedPlaces = ObservableList.of([]);
  @readonly
  int? _sortColumnIndex;
  @readonly
  bool _sortAscending = true;
  @readonly
  bool _isLoading = false;

  bool _sortNameAscending = true;
  bool _sortTimesVisitedAscending = true;
  bool _sortReviewsNumberAscending = true;

  @action
  Future<void> load() async {
    _isLoading = true;
    try {
      final loadedPlaces = await _placesUseCase.getPlaces();
      places = ObservableList.of(loadedPlaces);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void onNameSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortNameAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortNameAscending;
    }
    places.sort(
      (a, b) => _sortAscending //
          ? a.name.compareTo(b.name)
          : b.name.compareTo(a.name),
    );
  }

  @action
  void onTimesVisitedSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortTimesVisitedAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortTimesVisitedAscending;
    }
    places.sort(
      (a, b) => _sortAscending //
          ? b.timesVisited.compareTo(a.timesVisited)
          : a.timesVisited.compareTo(b.timesVisited),
    );
  }

  @action
  void onReviewsNumberSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortReviewsNumberAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortReviewsNumberAscending;
    }
    places.sort(
      (a, b) => _sortAscending //
          ? b.reviewsNumber.compareTo(a.reviewsNumber)
          : a.reviewsNumber.compareTo(b.reviewsNumber),
    );
  }

  @action
  void onPlaceSelected({
    required Place place,
    required bool? isSelected,
  }) {
    if (isSelected == null) {
      return;
    }
    if (isSelected) {
      selectedPlaces.add(place);
      return;
    }
    selectedPlaces.remove(place);
  }
}
