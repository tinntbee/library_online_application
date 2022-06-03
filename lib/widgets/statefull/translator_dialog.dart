import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../icons/bee_app_icons.dart';

class TranslatorDialog extends StatefulWidget {
  const TranslatorDialog({Key? key}) : super(key: key);

  @override
  State<TranslatorDialog> createState() => _TranslatorDialogState();
}

class _TranslatorDialogState extends State<TranslatorDialog> {
  final _textInputController = TextEditingController();
  final _textOutputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.bottomCenter,
      child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.1),
                  blurRadius: 8,
                )
              ]),
          width: double.infinity,
          height: 167,
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                const Text("Translator",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF027B76))),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF26905B).withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: TextFormField(
                        controller: _textInputController,
                        decoration: InputDecoration(
                          hintText: "Source",
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
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          onTap: () {}, // Handle your onTap
                          child: Ink(
                            child: const Icon(
                              BeeAppIcons.translator,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9B700).withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: TextFormField(
                        controller: _textOutputController,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "Translated",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6D6D).withOpacity(0.5)),
                          border: InputBorder.none,
                          counterText: "",
                          focusColor: Color(0xFF6D6D6D),
                          contentPadding: EdgeInsets.all(0),
                        ),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF027B76),
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Color(0xFF6D6D6D).withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          onTap: () {}, // Handle your onTap
                          child: Ink(
                            child: const Icon(
                              BeeAppIcons.add_flashcard,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
