import 'package:flutter/material.dart';
import 'package:library_online_application/widgets/statefull/book_by_categories.dart';
import 'package:library_online_application/widgets/statefull/book_for_you.dart';
import 'package:library_online_application/widgets/statefull/book_trending.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140), // Set this height
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.dashboard_rounded,
                      color: Color.fromRGBO(109, 109, 109, 1),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "LIBRARY",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(109, 109, 109, 1)),
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Image.network(
                        "https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/240581367_3138938299764392_2228439304544764616_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=174925&_nc_ohc=4RAL07PQdggAX-kSYxz&_nc_ht=scontent.fsgn4-1.fna&oh=00_AT9CKVXKKfs6arSnyrqubgNC2mHepqtnA-dLE9uSgcDL5Q&oe=6265842D",
                        width: 34,
                        height: 34,
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.search,
                          color: Color.fromRGBO(191, 191, 191, 1),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1)),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(191, 191, 191, 1)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [BookForYou(), BookTrending(), BookByCategories()],
      ),
      backgroundColor: Colors.white,
    );
  }
}
