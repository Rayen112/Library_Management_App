import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/screens/tabs_screen.dart';
import 'package:library_app/widgets/favorite_grid_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(
      {super.key,
      required this.favoriteBooks,
      required this.selectBook,
      required this.removeBook});
  final List<Book> favoriteBooks;
  final void Function(BuildContext, Book) selectBook;
  final void Function(List<Book>, Book) removeBook;

  @override
  Widget build(BuildContext context) {
    final Widget? currentScreen;
    if (favoriteBooks.isNotEmpty) {
      currentScreen = ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (final book in favoriteBooks)
            Dismissible(
              key: ValueKey(book),
              background: Container(
                color: Theme.of(context).colorScheme.error,
              ),
              onDismissed: (direction) => removeBook(favoriteBooks, book),
              child: FavoriteGridItem(
                book: book,
                selectBook: selectBook,
              ),
            )
        ],
      );
    } else {
      currentScreen = Center(
          child: Text(
        "There is no favorite book! ",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.black, fontSize: 24),
      ));
    }
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TabsScreen(),
            ),
          );
          return false;
        },
        child: currentScreen);
  }
}
