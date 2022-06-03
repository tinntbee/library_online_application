import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/api/bookcase_api.dart';
import 'package:library_online_application/models/book_in_bookcase.dart';
import 'package:library_online_application/screens/bookcase/widgets/book-in-book-case-item.dart';
import 'package:library_online_application/widgets/statefull/search-bar.dart';

import '../../../icons/bee_app_icons.dart';
import '../../../providers/bookcase_provider.dart';

class BooksInBookcase extends StatefulWidget {
  const BooksInBookcase({Key? key}) : super(key: key);

  @override
  State<BooksInBookcase> createState() => _BooksInBookcaseState();
}

class _BooksInBookcaseState extends State<BooksInBookcase>
    with AutomaticKeepAliveClientMixin<BooksInBookcase> {
  final bookcaseProvider = BookcaseProvider();
  List<BookInBookcase> _books = [];
  List<BookInBookcase> _booksFilter = [];
  String _filter = "";
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooks();
    bookcaseProvider.addListener(() {
      _books = bookcaseProvider.books;
      setBooksFilter(_filter);
    });
  }

  Future<void> getBooks() async {
    setState(() {
      _loading = true;
    });
    List<BookInBookcase> books = await BookcaseApi.getBooks();
    bookcaseProvider.setBooks(books);
    setBooksFilter("");
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _loading = false;
    });
  }

  void setBooksFilter(String search) {
    List<BookInBookcase> booksFilter = _books
        .where((book) =>
            (book.book!.name.toLowerCase().contains(search.toLowerCase()) ||
                book.book!.tags!
                    .where((tag) =>
                        tag.name!.toLowerCase().contains(search.toLowerCase()))
                    .isNotEmpty))
        .toList();
    setState(() {
      _filter = search;
      _booksFilter = booksFilter;
    });
  }

  Future<void> deleteBook(String bookId) async {
    setState(() {
      _loading = true;
    });
    int status = await BookcaseApi.deleteBooks(bookId);
    if (status == 200) {
      ScaffoldMessenger.of(context).showSnackBar(notifySnackbarWidget(
          "success", "Delete Success!", Color(0xFF27AE60)));
      bookcaseProvider.deleteBooks(bookId);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          notifySnackbarWidget("error", "Delete Failed!", Color(0xFFEB5757)));
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            RefreshIndicator(
              color: Color(0xFFA4A4A4),
              onRefresh: () async {
                getBooks();
              },
              child: CustomScrollView(
                cacheExtent: 2,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // persistent header
                  SearchBar(handleSearch: (search) {
                    setBooksFilter(search);
                  }),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ..._booksFilter
                            .map((e) => BookInBookcaseItem(
                                book: e,
                                handleDelete: () {
                                  deleteBook(e.book!.id);
                                }))
                            .toList(),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _loading ? booksLoadingWidget : SizedBox()
          ],
        ));
  }

  final booksLoadingWidget = Container(
    width: double.infinity,
    height: double.infinity,
    color: Color(0xFFFFFFFF).withOpacity(0.6),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCubeGrid(
            color: Color(0xFFBFBFBF).withOpacity(0.5),
            size: 110,
          ),
        ],
      ),
    ),
  );

  SnackBar notifySnackbarWidget(String status, String message, Color color) {
    return SnackBar(
      content: Row(children: [
        Icon(
            status == "success"
                ? BeeAppIcons.success
                : status == "error"
                    ? BeeAppIcons.error
                    : BeeAppIcons.warning,
            color: Colors.white),
        SizedBox(
          width: 5,
        ),
        Text(
          message,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        )
      ]),
      duration: Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: color,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
