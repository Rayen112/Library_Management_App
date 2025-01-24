import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';

class BookGridItem extends StatelessWidget {
  const BookGridItem({super.key, required this.book, required this.selectBook});
  final Book book;
  final void Function(Book book) selectBook;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectBook(book);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.transparent,
      child: SizedBox(
        width: 150,
        height: 400,
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: "dash+ ${book.bookId}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: book.image,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  book.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.black, fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
