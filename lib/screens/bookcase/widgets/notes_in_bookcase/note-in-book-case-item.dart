import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/models/note.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:library_online_application/providers/reading_space_provider.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/bee_space.dart';
import 'package:provider/provider.dart';
import 'delete_confirm.dart';
import 'modify_note.dart';

class NoteInBookcaseItem extends StatelessWidget {
  final Note note;
  final Function handleDelete;
  final Function handleModify;

  const NoteInBookcaseItem(
      {Key? key,
      required this.note,
      required this.handleDelete,
      required this.handleModify})
      : super(key: key);

  Future showDeleteDialog(context, Note note, Function handleSubmit) async {
    return await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return DeleteConfirm(note: note, submit: handleSubmit);
      },
      transitionBuilder: (_, anim, __, child) {
        var tween;
        const curve = Curves.easeInOut;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero)
              .chain(CurveTween(curve: curve));
        } else {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero)
              .chain(CurveTween(curve: curve));
          ;
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void handleDeleteClick(context) {
    showDeleteDialog(context, note, handleDelete);
  }

  Future showModifyNoteDialog(context, Note note, Function handleSubmit) async {
    return await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return ModifyNote(note: note, submit: handleSubmit);
      },
      transitionBuilder: (_, anim, __, child) {
        var tween;
        const curve = Curves.easeInOut;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero)
              .chain(CurveTween(curve: curve));
        } else {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero)
              .chain(CurveTween(curve: curve));
          ;
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void handleModifyClick(context) {
    showModifyNoteDialog(context, note, handleModify);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        extentRatio: 0.3,
        // A pane can dismiss the Slidable.
        // dismissible: DismissiblePane(onDismissed: () {}),
        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: Color(0xFFF9B700),
            foregroundColor: Colors.white,
            icon: BeeAppIcons.note,
            label: 'Note',
            padding: EdgeInsets.all(0),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          SlidableAction(
            onPressed: (BuildContext context) {
              handleModifyClick(context);
            },
            backgroundColor: Color(0xFF027B76),
            foregroundColor: Colors.white,
            icon: BeeAppIcons.note,
            label: 'Modify',
            padding: EdgeInsets.all(0),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.15,
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (BuildContext context) {
              handleDeleteClick(context);
            },
            backgroundColor: Color(0xFFEB5757),
            foregroundColor: Colors.white,
            icon: BeeAppIcons.delete,
            label: 'Delete',
            padding: EdgeInsets.all(0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: Container(
          height: 143,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                await Provider.of<ReadingSpaceProvider>(context, listen: false)
                    .fetchAndSetNoteDetail(note.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BeeSpace()),
                );
              }, // Handle your onTap
              child: Ink(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          note.image!,
                          height: 130,
                          width: 130,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const FlutterLogo(
                              size: 130,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4F4F4F),
                                  height: 1.2),
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Link with book: “${note.book.name}” - ${note.book.author ?? ""}",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  color: Color(0xFF6D6D6D)),
                              maxLines: 2,
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 8),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFF9B700).withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Text(
                                "Page ${note.page} of ${note.book.totalPages}",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFF9B700)),
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
