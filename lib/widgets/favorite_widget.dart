import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/providers/favorites_provider.dart';

class FavoriteWidget extends ConsumerWidget {
  const FavoriteWidget({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteBooks = ref.watch(favoritesBookProvider);
    final isFavorite = favoriteBooks.contains(book);
    return Container(
      height: 45,
      width: MediaQuery.sizeOf(context).width - 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Color.fromARGB(255, 229, 224, 201),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoritesBookProvider.notifier)
                  .toggleBookFavoriteStatus(book);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? "Book added as a favorite"
                      : "Book is removed")));
            },
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
          ),
          Container(
            height: 45,
            width: 5,
            color: Color.fromARGB(
              255,
              249,
              245,
              217,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Select Favorite",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.black, fontSize: 10),
          )
        ],
      ),
    );
  }
}
