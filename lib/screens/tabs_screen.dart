import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/providers/favorites_provider.dart';
import 'package:library_app/screens/book_screen.dart';
import 'package:library_app/screens/categories_screen.dart';
import 'package:library_app/screens/favorites_screen.dart';
import 'package:library_app/screens/search_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  String title = "Library Management App";
  int _selectedPageIndex = 0;
  void _removeBook(List<Book> books, Book book) {
    books.remove(book);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Book removed from favorites ")));
  }

  void selectBook(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookScreen(
          book: book,
        ),
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = CategoriesScreen(
      selectBook: selectBook,
    );
    if (_selectedPageIndex == 1) {
      currentScreen = SearchScreen(selectBook: selectBook,);
      title = "Search Bar";
    } else {
      if (_selectedPageIndex == 2) {
        title = "Favorite Books";
        final favoriteBooks = ref.watch(favoritesBookProvider);
        currentScreen = FavoritesScreen(
          favoriteBooks: favoriteBooks,
          selectBook: selectBook,
          removeBook: _removeBook,
        );
      } else {
        if (_selectedPageIndex == 0) {
          currentScreen = CategoriesScreen(selectBook: selectBook);
          title = "Library Management App";
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
      ),
    );
  }
}
