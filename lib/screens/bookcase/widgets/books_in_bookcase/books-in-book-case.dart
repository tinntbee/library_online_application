import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/api/bookcase_api.dart';
import 'package:library_online_application/api/note_api.dart';
import 'package:library_online_application/models/book_in_bookcase.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/screens/bookcase/widgets/books_in_bookcase/book-in-book-case-item.dart';
import 'package:library_online_application/widgets/statefull/search-bar.dart';
import 'package:library_online_application/widgets/stateless/notifycation_bar.dart';
import 'package:provider/provider.dart';

import '../../../../icons/bee_app_icons.dart';
import '../../../../providers/bookcase_provider.dart';

class BooksInBookcase extends StatefulWidget {
  const BooksInBookcase({Key? key}) : super(key: key);

  @override
  State<BooksInBookcase> createState() => _BooksInBookcaseState();
}

class _BooksInBookcaseState extends State<BooksInBookcase>
    with AutomaticKeepAliveClientMixin<BooksInBookcase> {
  String _filter = "";
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

  bool checkFilter(BookInBookcase book, String search) {
    return (book.book!.name.toLowerCase().contains(search.toLowerCase()) ||
        book.book!.tags!
            .where(
                (tag) => tag.name!.toLowerCase().contains(search.toLowerCase()))
            .isNotEmpty);
  }

  Future<void> deleteBook(BuildContext context, String bookId) async {
    setState(() {
      _loading = true;
    });
    Provider.of<BookcaseProvider>(context, listen: false)
        .deleteAndUpdateBooks(bookId)
        .then((value) {
      if (value == 200) {
        ScaffoldMessenger.of(context).showSnackBar(NotificationSnackBar(
            "success", "Delete Success!", Color(0xFF27AE60)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            NotificationSnackBar("error", "Delete Fail!", Color(0xFF27AE60)));
      }
      setState(() {
        _loading = false;
      });
    });
  }

  Future<void> createNewNote(Note note) async {
    setState(() {
      _loading = true;
    });
    Provider.of<BookcaseProvider>(context, listen: false)
        .addNoteAndUpdate(note)
        .then((value) {
      if (value == 200) {
        ScaffoldMessenger.of(context).showSnackBar(NotificationSnackBar(
            "success", "Create Success!", Color(0xFF27AE60)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            NotificationSnackBar("error", "Create Fail!", Color(0xFF27AE60)));
      }
      setState(() {
        _loading = false;
      });
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
                getBooks(context);
              },
              child: CustomScrollView(
                cacheExtent: 2,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // persistent header
                  SearchBar(handleSearch: (search) {
                    setState(() {
                      _filter = search;
                    });
                  }),
                  SliverToBoxAdapter(
                      child: Consumer<BookcaseProvider>(
                    builder: ((context, value, child) => Column(
                          children: [
                            ...value.books
                                .map((e) => checkFilter(e, _filter)
                                    ? BookInBookcaseItem(
                                        book: e,
                                        handleDelete: () {
                                          deleteBook(context, e.book!.id);
                                        },
                                        handleCreate: (Note note) {
                                          createNewNote(note);
                                        },
                                      )
                                    : SizedBox())
                                .toList(),
                            SizedBox(
                              height: 60,
                            )
                          ],
                        )),
                  )),
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
