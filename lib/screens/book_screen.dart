import 'package:flutter/material.dart';
import 'package:library_app/data/books.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/widgets/book_info.dart';
import 'package:library_app/widgets/bookgriditem.dart';
import 'package:library_app/widgets/favorite_widget.dart';
import 'package:library_app/widgets/start_reading.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key, required this.book});
  final Book book;

  @override
  State<BookScreen> createState() {
    return _BookScreenState();
  }
}

class _BookScreenState extends State<BookScreen> {
  var about = false;
  var similar = false;
  Widget infoSection = Text("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 100),
                    child: SizedBox(
                      height: 300,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(25),
                        child: Hero(
                          tag: "dash+ ${widget.book.bookId}",
                          child: widget.book.image,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 2,
                    widget.book.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "By ${widget.book.writer}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FavoriteWidget(
                    book: widget.book,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BookInfo(book: widget.book),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        StartReading(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    about = true;
                                    similar = false;
                                    infoSection = Text(
                                      widget.book.resume,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(fontSize: 15),
                                    );
                                  });
                                },
                                child: Text(
                                  "About",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: about == false
                                              ? Colors.grey
                                              : Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Lato"),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    about = false;
                                    similar = true;
                                    infoSection = SizedBox(
                                      height: 200,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          for (final bookk in books)
                                            if (widget.book.category ==
                                                    bookk.category &&
                                                widget.book.bookId !=
                                                    bookk.bookId) ...[
                                              BookGridItem(
                                                  book: bookk,
                                                  selectBook: (book) {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                BookScreen(
                                                                    book:
                                                                        bookk)));
                                                  }),
                                              SizedBox(
                                                width: 20,
                                              )
                                            ]
                                        ],
                                      ),
                                    );
                                  });
                                },
                                child: Text(
                                  "Similar",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: similar == false
                                              ? Colors.grey
                                              : Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Lato"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: SizedBox(child: infoSection),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
