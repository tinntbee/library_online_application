import 'package:flutter/material.dart';
import 'package:library_online_application/screens/bookcase/widgets/book-in-book-case-item.dart';
import 'package:library_online_application/widgets/statefull/search-bar.dart';

class BooksInBookcase extends StatefulWidget {
  const BooksInBookcase({Key? key}) : super(key: key);

  @override
  State<BooksInBookcase> createState() => _BooksInBookcaseState();
}

class _BooksInBookcaseState extends State<BooksInBookcase>
    with AutomaticKeepAliveClientMixin<BooksInBookcase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // persistent header
          SearchBar(handleSearch: () {}),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                BookInBookcaseItem(),
                BookInBookcaseItem(),
                BookInBookcaseItem(),
                BookInBookcaseItem(),
                BookInBookcaseItem(),
                BookInBookcaseItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
