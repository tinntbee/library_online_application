import 'package:flutter/material.dart';
import 'package:library_online_application/widgets/statefull/book_by_tags.dart';
import 'package:library_online_application/widgets/statefull/tags_by_categories.dart';

class BookByCategories extends StatefulWidget {
  const BookByCategories({Key? key}) : super(key: key);

  @override
  State<BookByCategories> createState() => _BookByCategoriesState();
}

class _BookByCategoriesState extends State<BookByCategories> {
  final List categories = [
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FlifeStyle.png?alt=media&token=4a8feb3e-4ee2-4989-8a9c-b8ac21dc42fc",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FdevCode.png?alt=media&token=a5257209-2a6c-41e5-b7b6-49a50aca34f5",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FscienceSpace.png?alt=media&token=63681758-8348-41cc-b7e4-99edd5d01ccb",
  ];

  final List _listTagsByCategories = [
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FlifeStyleBook.png?alt=media&token=5eb3d9a2-4eb3-42fc-a529-b3c2e735a7f9",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FcodeDevBook.png?alt=media&token=c33b7633-da63-4bf7-b4ae-9a86f6943171"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              "Categories",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(109, 109, 109, 1)),
            ),
          ),
          Container(
            width: double.infinity,
            height: 140,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: categories
                  .map((e) => Padding(
                        padding: EdgeInsets.all(15),
                        child: Image.network(e),
                      ))
                  .toList(),
            ),
          ),
          Column(
            children: _listTagsByCategories
                .asMap()
                .entries
                .map((e) =>
                    TagsByCategories(index: e.key, imageThumbnail: e.value))
                .toList(),
          )
        ],
      ),
    );
  }
}
