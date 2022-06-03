import 'package:flutter/material.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/providers/reading_space_provider.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/bee_space.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/reading_and_note_space.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/reading_space.dart';
import 'package:provider/provider.dart';

class NoteInReadingSpaceItem extends StatelessWidget {
  final Note note;
  const NoteInReadingSpaceItem({Key? key, required this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFF26905B).withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      clipBehavior: Clip.hardEdge,
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
              child: Container(
            width: double.infinity,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    note.image ?? "",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const FlutterLogo(
                        size: 150,
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        note.name,
                        style: const TextStyle(
                            color: Color(0xFF6D6D6D),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
