import 'package:flutter/material.dart';
import 'package:library_app/data/books.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/screens/tabs_screen.dart';
import 'package:library_app/widgets/favorite_grid_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.selectBook});

  final void Function(BuildContext context, Book book) selectBook;

  @override
  State<SearchScreen> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Book> filteredBooks = [];
  String query = "";

  void filterBooks(String newQuery) {
    setState(() {
      final query = newQuery.toLowerCase();
      if (query.isEmpty) {
        filteredBooks = books;
      } else {
        final List<Book> result = books.where((book) {
          final titleLower = book.title.toLowerCase();
          return titleLower.contains(query) ||
              book.writer.toLowerCase().contains(query);
        }).toList();
        filteredBooks = result;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Column(
          children: [
            TextField(
              onChanged: filterBooks,
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search by the name of the book",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) => FavoriteGridItem(
                      book: filteredBooks[index],
                      selectBook: widget.selectBook)),
            )
          ],
        ),
      ),
    );
  }
}
