import 'dart:developer';
import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/models/book.dart';
import 'package:library_online_application/models/tag.dart';
import 'package:library_online_application/screens/book-detail/book_detail.dart';

class BookByTags extends StatefulWidget {
  final Tag? tag;
  const BookByTags({Key? key, required this.tag}) : super(key: key);
  @override
  State<BookByTags> createState() => _BookByTagsState();
}

class _BookByTagsState extends State<BookByTags> {
  List<Book> books = [];

  double _position = 0.0;

  int _index = 0;

  void draw(int index) {
    setState(() {
      _position = (index + 1) / books.length;
      _index = index;
    });
  }

  Future<void> getBooksByTag(tagId) async {
    List<Book> listBooks = await BookApi.getBookByTag(tagId);
    setState(() {
      books = listBooks;
      _position = (0 + 1) / books.length;
    });
  }

  @override
  void initState() {
    getBooksByTag(widget.tag?.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return books.isNotEmpty
        ? SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: Color(0xFF258F5A).withOpacity(0.1),
                        child: FractionallySizedBox(
                          heightFactor: 1,
                          widthFactor: _position,
                          alignment: Alignment.centerRight,
                          child: AnimatedContainer(
                              width: double.infinity,
                              height: 2,
                              color: Color.fromRGBO(37, 143, 90, 1),
                              duration: const Duration(seconds: 2),
                              // Provide an optional curve to make the animation feel smoother.
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "# ${widget.tag?.name}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 143, 90, 1)),
                      ),
                    ),
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
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 209,
                      scrollPhysics: const BouncingScrollPhysics(),
                      viewportFraction: 0.4,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      onPageChanged: (index, reason) {
                        draw(index);
                      }),
                  items: books.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            i.image!,
                            width: 143,
                            height: 209,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Container(
                                width: 143,
                                height: 209,
                                child: Center(
                                    child: const FlutterLogo(
                                  size: 130,
                                )),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          const Icon(
                            BeeAppIcons.thumb_up,
                            color: Color(0xFF6D6D6D),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Builder(builder: (BuildContext context) {
                            double perLike = books[_index].totalLike! *
                                100 /
                                (books[_index].totalLike! +
                                    books[_index].totalDislike!);
                            String perLikeToString = "";
                            if (perLike.isNaN) {
                              perLikeToString = "-";
                            } else {
                              perLikeToString = perLike.ceil().toString();
                            }

                            return Text(
                              perLikeToString,
                              style: const TextStyle(
                                  color: Color(0xFF6D6D6D),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          const Icon(
                            BeeAppIcons.cart,
                            color: Color(0xFF6D6D6D),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            books[_index].totalRead.toString(),
                            style: const TextStyle(
                                color: Color(0xFF6D6D6D),
                                fontSize: 10,
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
                            BeeAppIcons.flower,
                            color: Color(0xFFF9B700),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            books[_index].price.toString(),
                            style: const TextStyle(
                                color: Color(0xFF6D6D6D),
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookDetail()),
                    );
                  },
                  child: Text(
                    books[_index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xFF6D6D6D),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  books[_index].author ?? "-",
                  style: const TextStyle(
                      color: Color(0xFFA4A4A4),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        : Text("no book here");
  }
}
