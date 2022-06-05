import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/models/book_detail.dart';

class AnalystBar extends StatelessWidget {
  final BookDetail book;
  const AnalystBar({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(book);
    return Container(
      width: 240,
      height: 57,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0xFF000000).withOpacity(0.2), blurRadius: 16)
          ]),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                BeeAppIcons.flower,
                size: 18,
                color: Color(0xFFF9B700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                book.price.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6D6D)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                BeeAppIcons.cart,
                size: 18,
                color: Color(0xFF6D6D6D),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                book.totalRead.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6D6D)),
              )
            ],
          ),
          Container(
            width: 1,
            height: 20,
            color: Color(0xFF6D6D6D).withOpacity(0.5),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    BeeAppIcons.thumb_up,
                    size: 18,
                    color:
                        book.react == 1 ? Color(0xFFF9B700) : Color(0xFF6D6D6D),
                  ),
                  Icon(
                    BeeAppIcons.thumb_down,
                    size: 18,
                    color: book.react == -1
                        ? Color(0xFFF9B700)
                        : Color(0xFF6D6D6D),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "${(book.totalLike + book.totalDislike) != 0 ? (book.totalLike * 100 / (book.totalLike + book.totalDislike)).round() : "- "}% | ${book.totalLike + book.totalDislike}",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6D6D)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
