import 'package:flutter/material.dart';
import 'package:library_online_application/models/category.dart';
import 'package:library_online_application/models/tag.dart';
import 'package:library_online_application/screens/library/widgets/book_by_tags.dart';

class TagsByCategories extends StatelessWidget {
  final String imageThumbnail;
  final int index;
  final List<Tag>? tags;
  final Category category;
  const TagsByCategories({
    Key? key,
    required this.index,
    required this.imageThumbnail,
    required this.tags,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index % 2 != 1
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: 0,
                    right: 18,
                    child: Image.network(
                      imageThumbnail,
                      width: 60,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Container(
                          width: 60,
                          height: 90,
                          child: Center(
                              child: const FlutterLogo(
                            size: 130,
                          )),
                        );
                      },
                    )),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xFF26905B).withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                category.name ?? "-",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(37, 143, 90, 1)),
                              ),
                              Text(
                                category.quote ?? "-",
                                maxLines: 3,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    height: 1.3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(109, 109, 109, 1)),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: tags!
                              .map((e) => BookByTags(
                                    tag: e,
                                  ))
                              .toList(),
                        )
                      ],
                    )),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: 0,
                    left: 18,
                    child: Image.network(
                      imageThumbnail,
                      width: 60,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Container(
                          width: 60,
                          height: 90,
                          child: Center(
                              child: const FlutterLogo(
                            size: 130,
                          )),
                        );
                      },
                    )),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xFF26905B).withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category.name ?? "-",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(37, 143, 90, 1)),
                              ),
                              Text(
                                category.quote ?? "-",
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    height: 1.3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(109, 109, 109, 1)),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: tags!
                              .map((e) => BookByTags(
                                    tag: e,
                                  ))
                              .toList(),
                        )
                      ],
                    )),
              ],
            ),
          );
  }
}
