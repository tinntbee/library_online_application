import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_online_application/models/book.dart';
import 'package:library_online_application/models/note.dart';

class CreateNote extends StatelessWidget {
  final Book book;
  final Function submit;
  CreateNote({Key? key, required this.book, required this.submit})
      : super(key: key);

  final _textInputController = TextEditingController();
  final _focusTextInput = FocusNode();

  void handleSubmit() {
    if (_textInputController.text.isNotEmpty) {
      Note newNote = Note(
          id: "id",
          user: "user",
          book: book,
          name: _textInputController.text,
          image: book.image);
      submit(newNote);
    } else {
      _focusTextInput.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: Colors.transparent,
      child: Container(
        height: 354,
        width: MediaQuery.of(context).size.width - 30,
        padding: EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Create New Note",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF027B76))),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF26905B).withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextFormField(
                autofocus: true,
                focusNode: _focusTextInput,
                controller: _textInputController,
                decoration: InputDecoration(
                  hintText: "Note's name",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF027B76).withOpacity(0.5)),
                  border: InputBorder.none,
                  counterText: "",
                  focusColor: Color(0xFF027B76),
                  contentPadding: EdgeInsets.all(0),
                ),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF027B76),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  book.image!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
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
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.center,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  onTap: () {
                    Navigator.of(context).pop();
                    handleSubmit();
                  }, // Handle your onTap
                  child: Ink(
                      width: double.infinity,
                      height: double.infinity,
                      child: const Center(
                        child: Text(
                          "CREATE",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
