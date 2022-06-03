import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:library_online_application/screens/book-detail/widgets/book_forum.dart';
import 'package:library_online_application/screens/book-detail/widgets/book_info.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../api/book_api.dart';
import '../../models/book.dart';

class BookDetail extends StatefulWidget {
  final String? bookId;
  BookDetail({Key? key, required this.bookId}) : super(key: key);
  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail>
    with SingleTickerProviderStateMixin {
  Book? bookDetail;
  Future<void> detailBook(bookId) async {
    Book book = await BookApi.detailBook(bookId);
    setState(() {
      bookDetail = book;
    });
  }

  double _position = 0.0;

  int _index = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    detailBook(widget.bookId);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  var tagId = "61b982ae3cd1052a8febe8fd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Set this height
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            color: Color.fromRGBO(7, 116, 118, 1),
            child: Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    const SizedBox(width: 150),
                    Text(
                      "Book Detail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    width: double.infinity,
                    height: 2,
                    color: Color(0xFF258F5A).withOpacity(0.1),
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: _position,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: Color(0xFF258F5A),
                      ),
                    ),
                    duration: const Duration(seconds: 2),
                    // Provide an optional curve to make the animation feel smoother.
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(2, 123, 118, 0.7),
                        Color.fromRGBO(24, 95, 117, 0.7),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),

            SizedBox(
              height: 300,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    alignment: Alignment.center,
                    image: NetworkImage(bookDetail!.image ?? ""),
                    fit: BoxFit.cover,
                  ),
                  ClipRRect(
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: Image(
                          alignment: Alignment.center,
                          image: NetworkImage(bookDetail!.image ?? ""),
                          width: 200,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    right: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: 0.1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[100],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.thumb_up,
                                color: Color.fromRGBO(249, 183, 0, 1),
                                size: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Builder(builder: (BuildContext context) {
                                return Text(
                                  bookDetail!.totalLike.toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF6D6D6D),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                );
                              }),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.thumb_down,
                                color: Colors.black,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Builder(builder: (BuildContext context) {
                                return Text(
                                  bookDetail!.totalDislike.toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF6D6D6D),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                );
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: Color(0xFF6D6D6D),
                                      size: 25,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      bookDetail!.totalRead.toString(),
                                      style: const TextStyle(
                                          color: Color(0xFF6D6D6D),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      bookDetail!.totalLike.toString(),
                                      style: const TextStyle(
                                          color: Color(0xFF6D6D6D),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const BookDetail()),
              //   );
              // },
              child: Text(
                bookDetail!.name.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromRGBO(2, 123, 118, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              bookDetail!.author.toString(),
              style: const TextStyle(
                  color: Color(0xFFA4A4A4),
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 20,
            ),
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Information',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Forum',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  BookInfor(),
                  // second tab bar view widget
                  // BookForum()
                  BookInfor()
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.red!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Like',
                    hoverColor: Colors.red,
                    iconActiveColor: Colors.red,
                    textColor: Colors.redAccent,
                  ),
                  GButton(
                    icon: LineIcons.userPlus,
                    text: 'Add to Bookcase',
                    hoverColor: Colors.yellow,
                    iconActiveColor: Colors.white,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.bookOpen,
                    text: 'Read Now',
                    backgroundColor: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //backgroundColor: Colors.white,
  }
}
