import 'package:flutter/material.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_in_book_shelf/books_in_book_shelf.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_books/reading_books.dart';

class ReadingSpaceScreen extends StatefulWidget {
  const ReadingSpaceScreen({Key? key}) : super(key: key);

  @override
  State<ReadingSpaceScreen> createState() => _ReadingSpaceScreenState();
}

class _ReadingSpaceScreenState extends State<ReadingSpaceScreen> {
  static const List<Widget> _screens = <Widget>[
    ReadingBooks(),
    BooksInBookShelf(),
  ];
  int _selectedIndex = 0; //New

  void _onChangeTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/png/reading-space-background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        IndexedStack(
          children: _screens,
          index: _selectedIndex,
        )
      ],
    );
  }
}
