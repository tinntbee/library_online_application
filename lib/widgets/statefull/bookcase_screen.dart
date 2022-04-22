import 'package:flutter/material.dart';

class BookcaseScreen extends StatefulWidget {
  const BookcaseScreen({Key? key}) : super(key: key);

  @override
  State<BookcaseScreen> createState() => _BookcaseScreenState();
}

class _BookcaseScreenState extends State<BookcaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("bookcase"),
    );
  }
}
