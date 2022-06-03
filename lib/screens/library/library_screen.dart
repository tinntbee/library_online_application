import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/api/categories_api.dart';
import 'package:library_online_application/models/app_user.dart';
import 'package:library_online_application/models/category.dart';
import 'package:library_online_application/screens/library/widgets/library-app-bar.dart';
import 'package:library_online_application/widgets/statefull/library-search-bar.dart';
import 'package:library_online_application/screens/search-in-library/search_in_library.dart';
import 'package:library_online_application/utils/authentication.dart';
import 'package:library_online_application/screens/library/widgets/book_by_categories.dart';
import 'package:library_online_application/screens/library/widgets/book_for_you.dart';
import 'package:library_online_application/screens/library/widgets/book_trending.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    // Future<void> getBook() async {
    //   print(await BookApi.getBookByTag("61b982603cd1052a8febe8fc"));
    // }

    // getBook();
    return Scaffold(
      appBar: LibraryAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // persistent header
          LibrarySearchBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                BookForYou(),
                BookTrending(),
                BookByCategories(),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
