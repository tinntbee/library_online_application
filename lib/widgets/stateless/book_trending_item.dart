import 'package:flutter/material.dart';

class BookTrendingItem extends StatelessWidget {
  final int? index;
  const BookTrendingItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (index) {
      case 1:
        color = Color(0xFFF9B700);
        break;
      case 2:
        color = Color(0xFFEE7E4A);
        break;
      case 3:
        color = Color(0xFF1AA0BC);
        break;
      default:
        color = Color(0xFFA4A4A4);
    }

    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "$index",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FEloquent%20JavaScript-ver1642092283234?alt=media&token=fe49a054-f7b8-41bd-8833-744716f270c5",
                    width: 55,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Co Hai Con Meo Ngoi Ben Cua So",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(109, 109, 109, 1)),
                        ),
                        Text(
                          "Nguyen Nhat Anh",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(164, 164, 164, 1)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  Icon(
                                    Icons.thumb_up,
                                    size: 18,
                                    color: Color.fromRGBO(2, 123, 118, 1),
                                  ),
                                  Text(
                                    "87%",
                                    style: TextStyle(
                                        color: Color.fromRGBO(2, 123, 118, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 18,
                                    color: Color.fromRGBO(2, 123, 118, 1),
                                  ),
                                  Text(
                                    "1.3k",
                                    style: TextStyle(
                                        color: Color.fromRGBO(2, 123, 118, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.comment_rounded,
                                    size: 18,
                                    color: Color.fromRGBO(2, 123, 118, 1),
                                  ),
                                  Text(
                                    "2.3k",
                                    style: TextStyle(
                                        color: Color.fromRGBO(2, 123, 118, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "View Detail",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(7, 116, 118, 1)),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Color.fromRGBO(7, 116, 118, 1),
                                size: 18,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
