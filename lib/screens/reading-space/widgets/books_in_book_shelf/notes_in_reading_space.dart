import 'package:flutter/material.dart';

class NotesInReadingSpace extends StatefulWidget {
  const NotesInReadingSpace({Key? key}) : super(key: key);

  @override
  State<NotesInReadingSpace> createState() => _NotesInReadingSpaceState();
}

class _NotesInReadingSpaceState extends State<NotesInReadingSpace>
    with AutomaticKeepAliveClientMixin<NotesInReadingSpace> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
