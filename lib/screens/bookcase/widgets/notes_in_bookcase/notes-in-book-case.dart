import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_online_application/api/note_api.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/providers/bookcase_provider.dart';
import 'package:library_online_application/widgets/statefull/search-bar.dart';
import 'package:library_online_application/widgets/stateless/notifycation_bar.dart';
import 'package:provider/provider.dart';
import 'note-in-book-case-item.dart';

class NotesInBookcase extends StatefulWidget {
  const NotesInBookcase({Key? key}) : super(key: key);

  @override
  State<NotesInBookcase> createState() => _NotesInBookcaseState();
}

class _NotesInBookcaseState extends State<NotesInBookcase>
    with AutomaticKeepAliveClientMixin<NotesInBookcase> {
  final bookcaseProvider = BookcaseProvider();
  String _filter = "";
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loading = true;
    });
    Provider.of<BookcaseProvider>(context, listen: false)
        .fetchAndSetNotes()
        .then((_) {
      setState(() {
        _loading = false;
      });
    });
  }

  bool checkFilter(Note note, String search) {
    return (note.book.name.toLowerCase().contains(search.toLowerCase()) ||
        note.name.toLowerCase().contains(search.toLowerCase()));
  }

  Future<void> modifyNote(BuildContext context, Note newNote) async {
    setState(() {
      _loading = true;
    });
    Provider.of<BookcaseProvider>(context, listen: false)
        .modifyNoteInfo(newNote)
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(NotificationSnackBar(
          "success", "Modify Success!", Color(0xFF27AE60)));
      setState(() {
        _loading = false;
      });
    });
  }

  void handleDelete(BuildContext context, String noteId) {
    Provider.of<BookcaseProvider>(context, listen: false)
        .deleteAndUpdateNotes(noteId)
        .then((value) => {
              if (value == 200)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      NotificationSnackBar(
                          "success", "Delete Success!", Color(0xFF27AE60)))
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      NotificationSnackBar(
                          "error", "Delete Fail!", Color(0xFF27AE60)))
                }
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
                setState(() {
                  _loading = true;
                });
                Provider.of<BookcaseProvider>(context, listen: false)
                    .fetchAndSetNotes()
                    .then((_) {
                  setState(() {
                    _loading = false;
                  });
                });
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  // persistent header
                  SearchBar(handleSearch: (search) {
                    setState(() {
                      _filter = search;
                    });
                  }),
                  SliverToBoxAdapter(
                      child: Consumer<BookcaseProvider>(
                    builder: ((context, value, child) => Column(
                          children: [
                            ...value.notes
                                .map((e) => checkFilter(e, _filter)
                                    ? NoteInBookcaseItem(
                                        note: e,
                                        handleDelete: () {
                                          handleDelete(context, e.id);
                                        },
                                        handleModify: (Note newNote) {
                                          modifyNote(context, newNote);
                                        },
                                      )
                                    : SizedBox())
                                .toList(),
                            SizedBox(
                              height: 60,
                            )
                          ],
                        )),
                  )),
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
