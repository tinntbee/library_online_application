import 'dart:developer';
import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BookByTags extends StatefulWidget {
  const BookByTags({Key? key}) : super(key: key);
  @override
  State<BookByTags> createState() => _BookByTagsState();
}

class _BookByTagsState extends State<BookByTags> {
  final List _listBook = [
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FZA2ravzxbk.webp?alt=media&token=da7bb3b7-3cbb-4a68-b8a7-138a5a714d75",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FlflbuEXwK6.webp?alt=media&token=2687d19a-6267-4425-b3ca-6d1e19031d07",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FxXT3chV4Pm.webp?alt=media&token=5edb2ee1-da95-4258-b198-27f27b58af6f"
  ];

  double _position = 0.0;

  void draw(int index) {
    setState(() {
      _position = (index + 1) / _listBook.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_position == 0) {
      draw(0);
    }
    return Container(
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "#Truyen Ngan",
                  style: TextStyle(
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
            items: _listBook.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      i,
                      width: 143,
                      height: 209,
                      fit: BoxFit.cover,
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
                  children: const [
                    Icon(
                      Icons.thumb_up,
                      color: Color(0xFF6D6D6D),
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "89%",
                      style: TextStyle(
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
                  children: const [
                    Icon(
                      Icons.shopping_cart,
                      color: Color(0xFF6D6D6D),
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "502",
                      style: TextStyle(
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
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Color(0xFF6D6D6D),
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "89%",
                      style: TextStyle(
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
          const Text(
            "Toi Thay Hoa Vang Tren Co Xanh",
            style: TextStyle(
                color: Color(0xFF6D6D6D),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          const Text(
            "Nguyen Nhat Anh",
            style: TextStyle(
                color: Color(0xFFA4A4A4),
                fontSize: 12,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
