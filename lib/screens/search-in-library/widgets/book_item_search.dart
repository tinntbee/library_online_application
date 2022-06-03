import 'package:flutter/material.dart';

class BookItemSearch extends StatelessWidget {
  const BookItemSearch(
      {Key? key, required this.image, required this.name, required this.author})
      : super(key: key);
  final String image;
  final String name;
  final String author;
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
              image,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
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
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  name,
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
                  author,
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
