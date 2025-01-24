import 'package:flutter/material.dart';
import 'package:library_app/data/books.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/widgets/bookgriditem.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.selectBook});
  final void Function(BuildContext, Book) selectBook;

  @override
  State<CategoriesScreen> createState() {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 20,
          mainAxisSpacing: 40),
      children: [
        for (final book in books)
          BookGridItem(
            book: book,
            selectBook: (book) {
              widget.selectBook(context, book);
            },
          )
      ],
    );
  }
}
