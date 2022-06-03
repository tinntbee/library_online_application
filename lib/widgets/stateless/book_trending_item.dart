import 'package:flutter/material.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/models/book.dart';

class BookTrendingItem extends StatelessWidget {
  final int? index;
  final Book book;
  const BookTrendingItem({Key? key, required this.index, required this.book})
      : super(key: key);

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
                    book.image ?? "-",
                    width: 55,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container(
                        width: 55,
                        child: Center(
                            child: const FlutterLogo(
                          size: 130,
                        )),
                      );
                    },
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
                      children: [
                        Text(
                          book.name,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(109, 109, 109, 1)),
                        ),
                        Text(
                          book.author ?? "No Author",
                          style: const TextStyle(
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
                                children: [
                                  const Icon(
                                    BeeAppIcons.thumb_up,
                                    size: 18,
                                    color: Color.fromRGBO(2, 123, 118, 1),
                                  ),
                                  Builder(builder: (BuildContext context) {
                                    double perLike = book.totalLike! *
                                        100 /
                                        (book.totalLike! + book.totalDislike!);
                                    String perLikeToString = "";
                                    if (perLike.isNaN) {
                                      perLikeToString = "-";
                                    } else {
                                      perLikeToString =
                                          perLike.ceil().toString() + "%";
                                    }

                                    return Text(
                                      perLikeToString,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(2, 123, 118, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    );
                                  }),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    BeeAppIcons.cart,
                                    size: 18,
                                    color: Color.fromRGBO(2, 123, 118, 1),
                                  ),
                                  Text(
                                    (book.totalRead ?? 0).toString(),
                                    style: const TextStyle(
                                        color: Color.fromRGBO(2, 123, 118, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    BeeAppIcons.comment,
                                    size: 18,
                                    color: Color.fromRGBO(2, 123, 118, 1),
                                  ),
                                  Text(
                                    (book.totalComment ?? 0).toString(),
                                    style: const TextStyle(
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
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                BeeAppIcons.arrow_right,
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
