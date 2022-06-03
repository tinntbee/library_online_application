import 'package:flutter/material.dart';
import 'package:library_online_application/api/bookcase_api.dart';
import 'package:library_online_application/utils/authentication.dart';

import 'widgets/books_in_bookcase/books-in-book-case.dart';
import 'widgets/notes_in_bookcase/notes-in-book-case.dart';

class BookcaseScreen extends StatefulWidget {
  const BookcaseScreen({Key? key}) : super(key: key);

  @override
  State<BookcaseScreen> createState() => _BookcaseScreenState();
}

class _BookcaseScreenState extends State<BookcaseScreen>
    with SingleTickerProviderStateMixin {
  bool _isRefresh = false;

  void refresh() {
    setState(() {
      _isRefresh = !_isRefresh;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookcaseInfo();
  }

  Future<void> getBookcaseInfo() async {
    BookcaseApi.getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.network(
          Authentication.appUser!.cover!,
          width: double.infinity,
          height: 270,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 160),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(80))),
                  clipBehavior: Clip.hardEdge,
                  child: const DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: PreferredSize(
                          preferredSize: Size(24, 24),
                          child: TabBar(
                            unselectedLabelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            labelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            labelColor: Color(0xFF027B76),
                            unselectedLabelColor: Color(0xFFA4A4A4),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Color(0xFF027B76),
                            isScrollable: true,
                            tabs: [
                              Tab(
                                key: Key("books-tab"),
                                text: "Books",
                              ),
                              Tab(
                                key: Key("notes-tab"),
                                text: "Notes",
                              ),
                            ],
                          )),
                      body: TabBarView(
                        key: Key("books"),
                        children: [
                          BooksInBookcase(),
                          NotesInBookcase(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
