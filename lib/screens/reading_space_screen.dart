import 'package:flutter/material.dart';

class ReadingSpaceScreen extends StatefulWidget {
  const ReadingSpaceScreen({Key? key}) : super(key: key);

  @override
  State<ReadingSpaceScreen> createState() => _ReadingSpaceScreenState();
}

class _ReadingSpaceScreenState extends State<ReadingSpaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("reading space"),
    );
  }
}
