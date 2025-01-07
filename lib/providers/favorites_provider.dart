import 'package:background_picker/models/image_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteBackgroundsNotifier extends StateNotifier<List<Background>> {
  FavoriteBackgroundsNotifier() : super([]);

  bool toggleFavoriteStatus(Background background) {
    final backgroundIsFavorite = state.contains(background);

    if (backgroundIsFavorite) {
      state =
          state.where((element) => element.name != background.name).toList();
      return false;
    } else {
      state = [...state, background];
      return true;
    }
  }
}

final favoriteBackgroundProvider =
    StateNotifierProvider<FavoriteBackgroundsNotifier, List<Background>>(
  (ref) => FavoriteBackgroundsNotifier(),
);
