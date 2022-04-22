import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BookForYou extends StatefulWidget {
  const BookForYou({Key? key}) : super(key: key);

  @override
  State<BookForYou> createState() => _BookForYouState();
}

class _BookForYouState extends State<BookForYou> {
  final List _listBook = [
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FZA2ravzxbk.webp?alt=media&token=da7bb3b7-3cbb-4a68-b8a7-138a5a714d75",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FlflbuEXwK6.webp?alt=media&token=2687d19a-6267-4425-b3ca-6d1e19031d07",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FxXT3chV4Pm.webp?alt=media&token=5edb2ee1-da95-4258-b198-27f27b58af6f"
  ];
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.5);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: const [
              Text(
                "Book For you",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(109, 109, 109, 1)),
              ),
              Spacer(),
              Text(
                "View more",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(2, 123, 118, 1)),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
                height: 209,
                viewportFraction: 0.4,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale),
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
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Nguyen Ngoc Anh",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(164, 164, 164, 1)),
                      ),
                      Text(
                        "Co Hai Con Meo Ngoi Ben Cua So",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(109, 109, 109, 1),
                            height: 1.2),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 48,
                  width: 180,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            "89%",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            "12K",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        width: 2,
                        height: 20,
                        color: Colors.white,
                      ),
                      const Text(
                        "View more",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
