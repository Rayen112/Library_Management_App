import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';

// List of Book instances:
List<Book> books = [
  // Science Fiction
  Book(
      bookId: 'SF001',
      title: 'Dune',
      image: Image.asset('assets/images/Dune.jpg', height: 500),
      category: Category.sciencefiction,
      categoryId: '1',
      resume:
          'Dune by Frank Herbert is a science fiction epic set in a desert world, where political intrigue, ecological survival, and the conflict over the valuable substance "spice" take center stage. The protagonist, Paul Atreides, must navigate a world full of dangers to ensure the survival of his family and their empire.',
      writer: "Frank Herbert",
      totalReads: 2500000,
      parts: 3,
      timeToFinish: '10 hours'),
  Book(
      bookId: 'SF002',
      title: 'Neuromancer',
      image: Image.asset('assets/images/Neuromancer.jpg', height: 500),
      category: Category.sciencefiction,
      categoryId: '1',
      resume:
          'Neuromancer by William Gibson is a cyberpunk novel about a washed-up computer hacker named Case who is hired by a mysterious employer to pull off the ultimate hack. Blending themes of AI, cyberspace, and dystopian futures, it’s a groundbreaking work that helped shape modern science fiction.',
      writer: "William Gibson",
      totalReads: 1800000,
      parts: 4,
      timeToFinish: '8 hours'),

  // Mystery
  Book(
      bookId: 'MYST001',
      title: 'The Girl with the Dragon Tattoo',
      image: Image.asset('assets/images/The Girl with the Dragon Tattoo.jpg',
          height: 500),
      category: Category.mystery,
      categoryId: '2',
      resume:
          'The Girl with the Dragon Tattoo by Stieg Larsson follows journalist Mikael Blomkvist and hacker Lisbeth Salander as they investigate the mysterious disappearance of a young woman from a wealthy family decades ago. The novel mixes suspense, social commentary, and complex characters.',
      writer: "Stieg Larsson",
      totalReads: 3000000,
      parts: 5,
      timeToFinish: '12 hours'),
  Book(
      bookId: 'MYST002',
      title: 'Gone Girl',
      image: Image.asset('assets/images/Gone Girl.jpg', height: 500),
      category: Category.mystery,
      categoryId: '2',
      resume:
          'Gone Girl by Gillian Flynn is a psychological thriller about the disappearance of Amy Dunne, and the suspicion that falls on her husband, Nick. The novel explores deception, media influence, and the complexities of marriage through alternating perspectives and unreliable narratives.',
      writer: "Gillian Flynn",
      totalReads: 2200000,
      parts: 4,
      timeToFinish: '10 hours'),

  // Fantasy
  Book(
      bookId: 'FANT001',
      title: 'Harry Potter and the Sorcerer\'s Stone',
      image: Image.asset(
          'assets/images/Harry Potter and the Sorcerer Stone.jpg',
          height: 500),
      category: Category.fantasy,
      categoryId: '3',
      resume:
          'Harry Potter and the Sorcerer\'s Stone by J.K. Rowling introduces Harry Potter, a young boy who discovers that he is a wizard and begins his magical education at Hogwarts School of Witchcraft and Wizardry. This book kicks off a series full of adventure, friendship, and the battle against dark forces.',
      writer: "J.K. Rowling",
      totalReads: 5000000,
      parts: 7,
      timeToFinish: '15 hours'),
  Book(
      bookId: 'FANT002',
      title: 'The Hobbit',
      image: Image.asset('assets/images/The Hobbit.jpg', height: 500),
      category: Category.fantasy,
      categoryId: '3',
      resume:
          'The Hobbit by J.R.R. Tolkien follows the journey of Bilbo Baggins, a hobbit who becomes an unlikely hero as he embarks on an adventure with a group of dwarves to reclaim their treasure from a fearsome dragon. A classic tale of bravery, friendship, and magic in Middle-earth.',
      writer: "J.R.R. Tolkien",
      totalReads: 3200000,
      parts: 6,
      timeToFinish: '9 hours'),

  // Non-fiction
  Book(
      bookId: 'NF001',
      title: 'Sapiens: A Brief History of Humankind',
      image: Image.asset(
          'assets/images/Sapiens A Brief History of Humankind.jpg',
          height: 500),
      category: Category.nonfiction,
      categoryId: '4',
      resume:
          'Sapiens by Yuval Noah Harari takes readers through the history of humanity, from the emergence of Homo sapiens in prehistory to modern times. The book explores key moments such as the Agricultural Revolution and the rise of empires, offering a thought-provoking look at human civilization.',
      writer: "Yuval Noah Harari",
      totalReads: 4000000,
      parts: 8,
      timeToFinish: '14 hours'),
  Book(
      bookId: 'NF002',
      title: 'Educated',
      image: Image.asset('assets/images/Educated.jpg', height: 500),
      category: Category.nonfiction,
      categoryId: '4',
      resume:
          'Educated by Tara Westover is a memoir about a woman who grows up in a strict, survivalist family in rural Idaho. With no formal schooling, Tara eventually escapes to gain an education and overcome the challenges of her upbringing. The book explores themes of self-invention, resilience, and the transformative power of learning.',
      writer: "Tara Westover",
      totalReads: 3500000,
      parts: 10,
      timeToFinish: '13 hours'),

  // Biography
  Book(
      bookId: 'BIO001',
      title: 'Steve Jobs',
      image: Image.asset('assets/images/Steve Jobs.jpg', height: 500),
      category: Category.biography,
      categoryId: '5',
      resume:
          'Steve Jobs by Walter Isaacson is the biography of the iconic co-founder of Apple Inc. It chronicles his life, his vision for technology, and the creation of revolutionary products like the iPhone, iPad, and Mac. The book paints a complex picture of a genius and a visionary, with both his brilliance and his flaws on full display.',
      writer: "Walter Isaacson",
      totalReads: 4500000,
      parts: 6,
      timeToFinish: '12 hours'),
  Book(
      bookId: 'BIO002',
      title: 'The Diary of a Young Girl',
      image: Image.asset('assets/images/The Diary of a Young Girl.jpg',
          height: 500),
      category: Category.biography,
      categoryId: '5',
      resume:
          'The Diary of a Young Girl by Anne Frank is the poignant account of a Jewish teenager hiding from the Nazis during World War II. Through her diary entries, Anne reflects on her thoughts, hopes, and struggles, offering a personal perspective on the horrors of the Holocaust and the resilience of the human spirit.',
      writer: "Anne Frank",
      totalReads: 5500000,
      parts: 5,
      timeToFinish: '11 hours'),
];
