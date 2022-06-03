import 'package:flutter/material.dart';
import 'package:library_online_application/api/note_api.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/providers/reading_space_provider.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_in_book_shelf/books_in_book_shelf.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_books/reading_books.dart';
import 'package:provider/provider.dart';

class ReadingSpaceScreen extends StatefulWidget {
  const ReadingSpaceScreen({Key? key}) : super(key: key);

  @override
  State<ReadingSpaceScreen> createState() => _ReadingSpaceScreenState();
}

class _ReadingSpaceScreenState extends State<ReadingSpaceScreen> {
  bool _loading = true;

  int _selectedIndex = 0; //New

  Future<void> _onChangeTapped(int index) async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ReadingSpaceProvider>(context, listen: false)
        .fetchAndSetNotesActive()
        .then((_) => setState(() {
              _loading = false;
            }));
    super.initState();
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
          index: _selectedIndex,
          children: [
            Consumer<ReadingSpaceProvider>(
              builder: (context, value, child) {
                if (value.notesActive.isEmpty) {
                  _onChangeTapped(1);
                } else {
                  _onChangeTapped(0);
                }
                return ReadingBooks(
                  notesActive: value.notesActive,
                );
              },
            ),
            BooksInBookShelf()
          ],
        )
      ],
    );
  }
}
