import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_online_application/models/book.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/note_space.dart';

class DeleteConfirm extends StatelessWidget {
  final Note note;
  final Function submit;
  const DeleteConfirm({Key? key, required this.note, required this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: Colors.transparent,
      child: Container(
        height: 185,
        width: MediaQuery.of(context).size.width - 30,
        padding: EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                note.image!,
                width: 110,
                height: 175,
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
                child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CONFIRM DELETE",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF95500)),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Do you want Delete “${note.name}” from your bookshelf?',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA4A4A4)),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 27,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              onTap: () {
                                Navigator.of(context).pop();
                              }, // Handle your onTap
                              child: Ink(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: const Center(
                                    child: Text(
                                      "CANCEL",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFF95500)),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 27,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF027B76),
                                    Color(0xFF185F75),
                                  ],
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              onTap: () {
                                Navigator.of(context).pop();
                                submit();
                              }, // Handle your onTap
                              child: Ink(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: const Center(
                                    child: Text(
                                      "CONFIRM",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
