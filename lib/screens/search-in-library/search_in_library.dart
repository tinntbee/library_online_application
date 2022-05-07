import 'package:flutter/material.dart';
import 'package:library_online_application/screens/search-in-library/widgets/book_item_search.dart';
import 'package:library_online_application/screens/search-in-library/widgets/result_search_bar.dart';
import 'package:library_online_application/screens/search-in-library/widgets/search_screen_app_bar.dart';

class SearchInLibrary extends StatefulWidget {
  const SearchInLibrary({Key? key}) : super(key: key);

  @override
  State<SearchInLibrary> createState() => _SearchInLibraryState();
}

class _SearchInLibraryState extends State<SearchInLibrary> {
  final List _listBook = [
    "https://images.squarespace-cdn.com/content/v1/5bd3fe687eb88c4d6f4376a3/1556852398184-2FC0WKGV276C7JZ8FLS8/101+Ways+to+Go+Zero+Waste+by+Kathryn+Kellogg",
    "https://static.wixstatic.com/media/8d5212_c27df4714bc54c81a94e27bfb01b8e8e~mv2.jpg/v1/fill/w_1000,h_1526,al_c,q_90,usm_0.66_1.00_0.01/8d5212_c27df4714bc54c81a94e27bfb01b8e8e~mv2.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/61oM4tzcU5L.jpg",
    "https://m.media-amazon.com/images/I/41UBUC71x7L.jpg",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FlflbuEXwK6.webp?alt=media&token=2687d19a-6267-4425-b3ca-6d1e19031d07",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FEloquent%20JavaScript-ver1642092283234?alt=media&token=fe49a054-f7b8-41bd-8833-744716f270c5"
  ];
  final List _listBookName = [
    "Waste Not Everyday",
    "101 Ways To Go Zero Waste",
    "How yo Give Up Plastic",
    "Recycling",
    "Eloquent Javascript",
    "Son Nam"
  ];
  final List _listBookAuthor = [
    "Erin Kho",
    "Kathryn Kellogg",
    "Will McCallum",
    "Niuloag",
    "third edition",
    "Nam Son"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchScreenAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // persistent header
          ResultSearchBar(),
          SliverToBoxAdapter(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: _listBook
                                      .asMap()
                                      .entries
                                      .map((e) => e.key % 2 == 1
                                          ? BookItemSearch(
                                              image: e.value,
                                              name: _listBookName[e.key],
                                              author: _listBookAuthor[e.key],
                                            )
                                          : SizedBox())
                                      .toList())),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: _listBook
                                      .asMap()
                                      .entries
                                      .map((e) => e.key % 2 == 0
                                          ? BookItemSearch(
                                              image: e.value,
                                              name: _listBookName[e.key],
                                              author: _listBookAuthor[e.key],
                                            )
                                          : SizedBox())
                                      .toList())),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: const Color(0xFF6D6D6D).withOpacity(0.1)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {}, // Handle your onTap
                            child: Ink(
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
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
                    ],
                  ))),
        ],
      ),
    );
  }
}
