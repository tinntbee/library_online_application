import 'package:flutter/material.dart';
import 'package:library_online_application/api/categories_api.dart';
import 'package:library_online_application/models/category.dart';
import 'package:library_online_application/models/tag.dart';
import 'package:library_online_application/widgets/statefull/book_by_tags.dart';
import 'package:library_online_application/widgets/statefull/tags_by_categories.dart';

class BookByCategories extends StatefulWidget {
  const BookByCategories({Key? key}) : super(key: key);

  @override
  State<BookByCategories> createState() => _BookByCategoriesState();
}

class _BookByCategoriesState extends State<BookByCategories> {
  List<Category> categories = [];

  final List _listTagsByCategories = [
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FlifeStyleBook.png?alt=media&token=5eb3d9a2-4eb3-42fc-a529-b3c2e735a7f9",
    "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fimages%2FcodeDevBook.png?alt=media&token=c33b7633-da63-4bf7-b4ae-9a86f6943171"
  ];

  Future<void> getData() async {
    List<Category> listCategories = await CategoryApi.getCategories();
    setState(() {
      categories = listCategories;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
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
          SizedBox(
            width: double.infinity,
            height: 140,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.network(categories[index].thumbnail.toString()),
                );
              },
            ),
          ),
          Column(
            children: categories
                .asMap()
                .entries
                .map((e) => TagsByCategories(
                    category: e.value,
                    index: e.key,
                    imageThumbnail: _listTagsByCategories[0],
                    tags: e.value.tags))
                .toList(),
          )
        ],
      ),
    );
  }
}
