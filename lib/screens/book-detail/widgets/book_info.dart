import 'dart:math';

import 'package:flutter/material.dart';
import 'package:library_online_application/api/tag_api.dart';
import 'package:library_online_application/models/book.dart';
import 'package:library_online_application/models/tag.dart';

import '../../../api/book_api.dart';
import '../../../widgets/statefull/library-search-bar.dart';

class BookInfor extends StatefulWidget {
  // final TextEditingController searchController;
  // final Function submit;
  // const BookInfor(
  //     {Key? key, required this.searchController, required this.submit})
  //     : super(key: key);
  const BookInfor({Key? key}) : super(key: key);
  @override
  State<BookInfor> createState() => _BookInforState();
}

class _BookInforState extends State<BookInfor> {
  List<Tag> tags = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "#",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6D6D6D)),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                  labelPadding: EdgeInsets.all(2.0),
                  label: Text(
                    "Van hoc",
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  backgroundColor: Colors.black54,
                  elevation: 5.0,
                  shadowColor: Colors.white,
                  padding: EdgeInsets.all(5.0),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                  labelPadding: EdgeInsets.all(2.0),
                  label: Text(
                    "Tu truyen",
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  backgroundColor: Colors.black54,
                  elevation: 5.0,
                  shadowColor: Colors.white,
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
          )),
          Text("Description")
        ],
      ),
    ));
  }
}
