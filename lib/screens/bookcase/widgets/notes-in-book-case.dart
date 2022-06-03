import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_online_application/api/note_api.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/providers/bookcase_provider.dart';
import 'package:library_online_application/screens/bookcase/widgets/note-in-book-case-item.dart';
import 'package:library_online_application/widgets/statefull/search-bar.dart';

class NotesInBookcase extends StatefulWidget {
  const NotesInBookcase({Key? key}) : super(key: key);

  @override
  State<NotesInBookcase> createState() => _NotesInBookcaseState();
}

class _NotesInBookcaseState extends State<NotesInBookcase>
    with AutomaticKeepAliveClientMixin<NotesInBookcase> {
  final bookcaseProvider = BookcaseProvider();
  List<Note> _notes = [];
  List<Note> _notesFilter = [];
  String _filter = "";
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotes();
    bookcaseProvider.addListener(() {
      _notes = bookcaseProvider.notes;
      setNoteFilter(_filter);
    });
  }

  Future<void> getNotes() async {
    setState(() {
      _loading = true;
    });
    List<Note> notes = await NoteApi.getNotes();
    print(notes);
    bookcaseProvider.setNotes(notes);
    setNoteFilter("");
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _loading = false;
    });
  }

  void setNoteFilter(String search) {
    List<Note> notesFilter = _notes
        .where((note) =>
            (note.name.toLowerCase().contains(search.toLowerCase()) ||
                note.book.name.toLowerCase().contains(search.toLowerCase()) ||
                (note.book.author ?? "-")
                    .toLowerCase()
                    .contains(search.toLowerCase())))
        .toList();
    setState(() {
      _filter = search;
      _notesFilter = notesFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            RefreshIndicator(
              color: Color(0xFFA4A4A4),
              onRefresh: () async {
                getNotes();
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  // persistent header
                  SearchBar(handleSearch: (search) {
                    setNoteFilter(search);
                  }),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ..._notesFilter
                            .map((e) => NoteInBookcaseItem(
                                note: e, handleDelete: () {}))
                            .toList(),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _loading ? notesLoadingWidget : SizedBox()
          ],
        ));
  }

  final notesLoadingWidget = Container(
    width: double.infinity,
    height: double.infinity,
    color: Color(0xFFFFFFFF).withOpacity(0.6),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCubeGrid(
            color: Color(0xFFBFBFBF).withOpacity(0.5),
            size: 110,
          ),
        ],
      ),
    ),
  );

  @override
  bool get wantKeepAlive => true;
}
