import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:library_online_application/widgets/stateless/book_trending_item.dart';

class BookTrending extends StatefulWidget {
  const BookTrending({Key? key}) : super(key: key);

  @override
  State<BookTrending> createState() => _BookTrendingState();
}

class _BookTrendingState extends State<BookTrending> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 352,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF027B76),
                Color(0xFF185F75),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 2,
            color: Color.fromRGBO(254, 254, 254, 0.5),
            margin: EdgeInsets.only(bottom: 5),
          ),
          Container(
            width: 40,
            height: 2,
            color: Color.fromRGBO(254, 254, 254, 0.5),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "Top Trending Books",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                  .asMap()
                  .entries
                  .map((e) => BookTrendingItem(
                        index: e.key + 1,
                      ))
                  .toList(),
            ),
          ))
        ],
      ),
    );
  }
}
