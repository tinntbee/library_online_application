import 'package:flutter/material.dart';
import 'package:library_online_application/api/bookcase_api.dart';
import 'package:library_online_application/models/book_in_bookcase.dart';
import 'package:library_online_application/providers/bookcase_provider.dart';
import 'package:library_online_application/screens/reading-space/widgets/books_in_book_shelf/book_in_reading_space_item.dart';
import 'package:provider/provider.dart';

class BooksInReadingSpace extends StatefulWidget {
  const BooksInReadingSpace({Key? key}) : super(key: key);

  @override
  State<BooksInReadingSpace> createState() => _BooksInReadingSpaceState();
}

class _BooksInReadingSpaceState extends State<BooksInReadingSpace>
    with AutomaticKeepAliveClientMixin<BooksInReadingSpace> {
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooks(context);
  }

  Future<void> getBooks(BuildContext context) async {
    setState(() {
      _loading = true;
    });
    Provider.of<BookcaseProvider>(context, listen: false)
        .fetchAndSetBooks()
        .then((_) => setState(() {
              _loading = false;
            }));
  }

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
                        child: Consumer<BookcaseProvider>(
                      builder: ((context, value, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: value.books
                              .asMap()
                              .entries
                              .map((e) => e.key % 2 == 0
                                  ? BookInReadingSpaceItem(book: e.value)
                                  : SizedBox())
                              .toList())),
                    )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Consumer<BookcaseProvider>(
                            builder: (context, value, child) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: value.books
                                    .asMap()
                                    .entries
                                    .map((e) => e.key % 2 == 1
                                        ? BookInReadingSpaceItem(book: e.value)
                                        : SizedBox())
                                    .toList()))),
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
