import 'package:flutter/material.dart';
import 'package:library_online_application/screens/bookcase/widgets/note-in-book-case-item.dart';
import 'package:library_online_application/widgets/statefull/search-bar.dart';

class NotesInBookcase extends StatefulWidget {
  const NotesInBookcase({Key? key}) : super(key: key);

  @override
  State<NotesInBookcase> createState() => _NotesInBookcaseState();
}

class _NotesInBookcaseState extends State<NotesInBookcase>
    with AutomaticKeepAliveClientMixin<NotesInBookcase> {
      
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // persistent header
          SearchBar(handleSearch: () {}),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                NoteInBookcaseItem(),
                NoteInBookcaseItem(),
                NoteInBookcaseItem(),
                NoteInBookcaseItem(),
                NoteInBookcaseItem(),
                NoteInBookcaseItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
