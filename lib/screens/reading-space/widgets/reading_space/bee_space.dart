import 'package:flutter/material.dart';
import 'package:library_online_application/providers/reading_space_provider.dart';
import 'package:provider/provider.dart';

class BeeSpace extends StatelessWidget {
  const BeeSpace({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ReadingSpaceProvider>(
        builder: ((context, value, child) => IndexedStack(
              index: value.index,
              children: value.readingAndNoteSpace,
            )));
  }
}
