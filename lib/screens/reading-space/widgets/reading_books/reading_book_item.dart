import 'package:flutter/material.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/providers/reading_space_provider.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/bee_space.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/reading_and_note_space.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/reading_space.dart';
import 'package:provider/provider.dart';

class ReadingBookItem extends StatelessWidget {
  const ReadingBookItem({Key? key, required this.isActive, required this.note})
      : super(key: key);
  final bool isActive;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 2),
                blurRadius: 16,
              )
            ],
          ),
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
                width: 254,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        note.image ?? "",
                        height: 234,
                        width: 234,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const FlutterLogo(
                            size: 234,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      note.name,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6D6D6D),
                          height: 1.2),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "27-09-2000",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFA4A4A4)),
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        ),
        Positioned(
            top: 15,
            left: 15,
            child: AnimatedOpacity(
              opacity: isActive ? 1 : 0,
              duration: Duration(milliseconds: 400),
              child: AnimatedRotation(
                turns: isActive ? 0.5 : 0,
                duration: Duration(milliseconds: 600),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onTap: () {
                      Provider.of<ReadingSpaceProvider>(context, listen: false)
                          .closeAndUpdateNotesActive(note.id);
                    }, // Handle your onTap
                    child: Ink(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF).withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
