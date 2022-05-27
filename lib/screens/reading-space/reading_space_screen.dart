import 'package:flutter/material.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_in_reading_space.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_reading_in_reading_space.dart';
import 'package:library_online_application/screens/reading-space/widgets/notes_in_reading_space.dart';

class ReadingSpaceScreen extends StatefulWidget {
  const ReadingSpaceScreen({Key? key}) : super(key: key);

  @override
  State<ReadingSpaceScreen> createState() => _ReadingSpaceScreenState();
}

class _ReadingSpaceScreenState extends State<ReadingSpaceScreen> {
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
        Container(
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
                  length: 3,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: PreferredSize(
                        child: TabBar(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          labelStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          labelColor: Color(0xFF027B76),
                          unselectedLabelColor: Color(0xFFA4A4A4),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Color(0xFF027B76),
                          isScrollable: true,
                          tabs: [
                            Tab(
                              text: "Reading",
                            ),
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
                      children: [
                        BooksReadingInReadingSpace(),
                        BooksInReadingSpace(),
                        NotesInReadingSpace()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
