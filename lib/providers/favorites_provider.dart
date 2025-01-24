import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_app/models/book.dart';

class FavoriteBookNotifier extends StateNotifier<List<Book>> {
  FavoriteBookNotifier() : super([]);

  bool toggleBookFavoriteStatus(Book book) {
    final bookIsFavorite = state.contains(book);
    if (bookIsFavorite) {
      state = state.where((b) => b.bookId != book.bookId).toList();
      return false;
    } else {
      state = [...state, book];
      return true;
    }
  }

}

final favoritesBookProvider =
    StateNotifierProvider<FavoriteBookNotifier, List<Book>>((ref) {
  return FavoriteBookNotifier();
});
