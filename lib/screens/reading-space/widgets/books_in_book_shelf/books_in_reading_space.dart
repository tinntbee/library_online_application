import 'package:flutter/material.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_in_book_shelf/note_in_reading_space_item.dart';

class BooksInReadingSpace extends StatefulWidget {
  const BooksInReadingSpace({Key? key}) : super(key: key);

  @override
  State<BooksInReadingSpace> createState() => _BooksInReadingSpaceState();
}

class _BooksInReadingSpaceState extends State<BooksInReadingSpace>
    with AutomaticKeepAliveClientMixin<BooksInReadingSpace> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
          child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          BookInReadingSpaceItem(),
                          BookInReadingSpaceItem(),
                          BookInReadingSpaceItem()
                        ])),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          BookInReadingSpaceItem(),
                          BookInReadingSpaceItem(),
                          BookInReadingSpaceItem(),
                          BookInReadingSpaceItem()
                        ])),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xFF6D6D6D).withOpacity(0.1)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {}, // Handle your onTap
                      child: Ink(
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Text(
                            "LOAD MORE",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF6D6D6D)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ])))
    ]);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
