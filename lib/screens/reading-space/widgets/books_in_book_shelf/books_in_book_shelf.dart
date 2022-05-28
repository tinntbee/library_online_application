import 'package:flutter/material.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_in_book_shelf/books_in_reading_space.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_in_book_shelf/notes_in_reading_space.dart';

class BooksInBookShelf extends StatelessWidget {
  const BooksInBookShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("FROM YOUR BOOK\nSHELF",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6D6D),
                    height: 1.2),
                maxLines: 2),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                    child: TabBar(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      unselectedLabelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      labelColor: Color(0xFF027B76),
                      unselectedLabelColor: Color(0xFFA4A4A4),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Color(0xFF027B76),
                      isScrollable: true,
                      tabs: [
                        Tab(
                          text: "Books",
                        ),
                        Tab(
                          text: "Notes",
                        ),
                      ],
                    ),
                    preferredSize: Size(24, 15)),
                body: TabBarView(
                  children: [BooksInReadingSpace(), NotesInReadingSpace()],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
