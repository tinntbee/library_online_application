import 'package:flutter/material.dart';

class BookInReadingSpaceItem extends StatelessWidget {
  const BookInReadingSpaceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xFF26905B).withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.network(
                "https://edit.org/images/cat/book-covers-big-2019101610.jpg"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "name",
                  style: const TextStyle(
                      color: Color(0xFF6D6D6D),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "author",
                  style: const TextStyle(
                      color: Color(0xFF6D6D6D),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
