import 'package:flutter/material.dart';

class BooksReadingInReadingSpace extends StatefulWidget {
  const BooksReadingInReadingSpace({Key? key}) : super(key: key);

  @override
  State<BooksReadingInReadingSpace> createState() =>
      _BooksReadingInReadingSpaceState();
}

class _BooksReadingInReadingSpaceState extends State<BooksReadingInReadingSpace>
    with AutomaticKeepAliveClientMixin<BooksReadingInReadingSpace> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
