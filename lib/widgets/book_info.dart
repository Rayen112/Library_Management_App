import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Reads",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    book.reads,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Color.fromARGB(149, 181, 172, 66),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              VerticalDivider(
                color: Colors.grey.withOpacity(0.55),
                thickness: 1.5,
                indent: 10,
                width: 40,
                endIndent: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Parts",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${book.parts} parts",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Color.fromARGB(149, 181, 172, 66),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              VerticalDivider(
                color: Colors.grey.withOpacity(0.55),
                thickness: 1.5,
                indent: 10,
                width: 40,
                endIndent: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Time",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    book.timeToFinish,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Color.fromARGB(149, 181, 172, 66),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
