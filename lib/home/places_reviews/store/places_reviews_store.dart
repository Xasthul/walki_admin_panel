import 'package:mobx/mobx.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/entity/place_review.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/use_case/places_reviews_use_case.dart';

part 'places_reviews_store.g.dart';

class PlacesReviewsStore = PlacesReviewsStoreBase with _$PlacesReviewsStore;

abstract class PlacesReviewsStoreBase with Store {
  PlacesReviewsStoreBase({
    required PlacesReviewsUseCase placesReviewsUseCase,
  }) : _placesReviewsUseCase = placesReviewsUseCase;

  final PlacesReviewsUseCase _placesReviewsUseCase;

  ObservableList<PlaceReview> placesReviews = ObservableList.of([]);
  @readonly
  PlaceReview? _selectedPlaceReview;
  @readonly
  int? _sortColumnIndex;
  @readonly
  bool _sortAscending = true;
  @readonly
  bool _isLoading = false;

  bool _sortPlaceNameAscending = true;
  bool _sortAuthorNameAscending = true;
  bool _sortContentAscending = true;
  bool _sortCreatedAtAscending = true;

  @action
  Future<void> load() async {
    _isLoading = true;
    try {
      final loadedReviews = await _placesReviewsUseCase.getPlacesReviews();
      placesReviews = ObservableList.of(loadedReviews);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void onReviewSelected({
    required PlaceReview review,
    required bool? isSelected,
  }) {
    if (isSelected == null) {
      return;
    }
    if (_selectedPlaceReview == review) {
      resetSelectedReview();
      return;
    }
    _selectedPlaceReview = review;
  }

  @action
  void resetSelectedReview() => _selectedPlaceReview = null;

  @action
  Future<void> removeSelectedReview() async {
    if (_selectedPlaceReview == null) {
      return;
    }
    _isLoading = true;
    try {
      await _placesReviewsUseCase.deletePlaceReview(reviewId: _selectedPlaceReview!.id);
      placesReviews.remove(_selectedPlaceReview!);
      resetSelectedReview();
    } finally {
      _isLoading = false;
    }
  }

  @action
  void onPlaceNameSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortPlaceNameAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortPlaceNameAscending;
    }
    placesReviews.sort(
      (a, b) => _sortAscending //
          ? a.placeName.compareTo(b.placeName)
          : b.placeName.compareTo(a.placeName),
    );
  }

  @action
  void onAuthorNameSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortAuthorNameAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortAuthorNameAscending;
    }
    placesReviews.sort(
      (a, b) => _sortAscending //
          ? a.authorName.compareTo(b.authorName)
          : b.authorName.compareTo(a.authorName),
    );
  }

  @action
  void onContentSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortContentAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortContentAscending;
    }
    placesReviews.sort(
      (a, b) => _sortAscending //
          ? a.content.compareTo(b.content)
          : b.content.compareTo(a.content),
    );
  }

  @action
  void onCreatedAtSort(int columnIndex, bool sortAscending) {
    if (columnIndex == _sortColumnIndex) {
      _sortAscending = _sortCreatedAtAscending = sortAscending;
    } else {
      _sortColumnIndex = columnIndex;
      _sortAscending = _sortCreatedAtAscending;
    }
    placesReviews.sort(
      (a, b) => _sortAscending //
          ? a.createdAt.compareTo(b.createdAt)
          : b.createdAt.compareTo(a.createdAt),
    );
  }
}
