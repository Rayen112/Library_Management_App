import 'package:flutter/material.dart';

enum Category { sciencefiction, mystery, fantasy, nonfiction, biography }

class Book {
  Book(
      {required this.bookId,
      required this.title,
      required this.image,
      required this.category,
      required this.categoryId,
      required this.resume,
      required this.writer,
      required this.totalReads,
      required this.parts,
      required this.timeToFinish});
  String bookId;
  String title;
  Image image;
  Category category;
  String categoryId;
  String resume;
  String writer;
  int totalReads;
  int parts;
  String timeToFinish;

  String get reads {
    if (totalReads / 1000000 > 1) {
      return "${totalReads / 1000000}M";
    } else {
      return "${totalReads / 1000}K";
    }
  }
}

