import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:morphable_shape/morphable_shape.dart';

import '../../icons/bee_app_icons.dart';

class CountDownDialog extends StatefulWidget {
  const CountDownDialog({Key? key}) : super(key: key);

  @override
  State<CountDownDialog> createState() => _CountDownDialogState();
}

class _CountDownDialogState extends State<CountDownDialog> {
  final _textFieldMinutesController = TextEditingController(text: "60");
  final _textFieldSecondsController = TextEditingController(text: "59");
  var _imageThumbail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageThumbail = imageThumbnailWidget(
        "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/defaults%2Favatar-default%2Favatar-default-03.png?alt=media&token=34fc5a2a-d1ab-4b52-9d01-5d01007cbb7a");
  }

  void _textFieldMinutesOnComplete(context) {
    String newText =
        _textFieldMinutesController.text.replaceAll(RegExp('[^0-9]'), '');
    int value = int.parse(newText);
    if (value > 60) {
      _textFieldMinutesController.text = "60";
    } else {
      if (value < 0) {
        _textFieldMinutesController.text = "00";
      } else if (value < 10) {
        _textFieldMinutesController.text = "0" + value.toString();
      }
    }
    FocusScope.of(context).unfocus();
  }

  void _textFieldSecondsOnComplete(context) {
    String newText =
        _textFieldSecondsController.text.replaceAll(RegExp('[^0-9]'), '');
    int value = int.parse(newText);
    if (value > 59) {
      _textFieldSecondsController.text = "59";
    } else {
      if (value < 0) {
        _textFieldSecondsController.text = "00";
      } else if (value < 10) {
        _textFieldSecondsController.text = "0" + value.toString();
      }
    }
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textFieldMinutesController.dispose();
    _textFieldSecondsController.dispose();
    super.dispose();
  }

  Widget imageThumbnailWidget(String image) {
    return Container(
      height: 120,
      width: 120,
      clipBehavior: Clip.hardEdge,
      decoration: ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.contain,
          ),
          shape: PolygonShapeBorder(
              sides: 6,
              border: DynamicBorderSide(
                style: BorderStyle.solid,
                width: 4,
                color: Color(0xFFF9B700),
                begin: 0.toPercentLength,
                end: 80.toPercentLength,
                strokeJoin: StrokeJoin.round,
                strokeCap: StrokeCap.round,
              ),
              cornerRadius: 10.toPercentLength,
              cornerStyle: CornerStyle.rounded)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: Colors.transparent,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 333,
          width: MediaQuery.of(context).size.width - 30,
          padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Let's go find the flowers!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF027B76))),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(BeeAppIcons.navigate_left,
                      size: 40, color: Color(0xFFBFBFBF)),
                  _imageThumbail,
                  const Icon(BeeAppIcons.navigate_right,
                      size: 40, color: Color(0xFFF9B700)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xFF26905B).withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 50,
                            child: TextFormField(
                                controller: _textFieldMinutesController,
                                onEditingComplete: () {
                                  _textFieldMinutesOnComplete(context);
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                    focusColor: Color(0xFF027B76),
                                    contentPadding: EdgeInsets.all(0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Color(0xFF027B76),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                maxLength: 2,
                                maxLengthEnforcement: MaxLengthEnforcement.none,
                                style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFA4A4A4),
                                    height: 1)),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 3),
                            child: const Text(
                              "m",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFFA4A4A4),
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: 3, left: 10, right: 10),
                            child: const Text(
                              ":",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFA4A4A4),
                                  height: 1),
                            ),
                          ),
                          Container(
                            width: 50,
                            child: TextFormField(
                              controller: _textFieldSecondsController,
                              onEditingComplete: () {
                                _textFieldSecondsOnComplete(context);
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  focusColor: Color(0xFF027B76),
                                  contentPadding: EdgeInsets.all(0),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Color(0xFF027B76),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2)))),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              maxLength: 2,
                              maxLengthEnforcement: MaxLengthEnforcement.none,
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFA4A4A4),
                                  height: 1),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 3),
                            child: const Text(
                              "s",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFFA4A4A4),
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Color(0xFF26905B).withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          onTap: () {}, // Handle your onTap
                          child: Ink(
                            child: const Icon(
                              BeeAppIcons.chart,
                              color: Color(0xFF027B76),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                const BorderRadius.all(Radius.circular(10))),
                        alignment: Alignment.center,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            onTap: () {}, // Handle your onTap
                            child: Ink(
                                width: double.infinity,
                                height: double.infinity,
                                child: const Center(
                                  child: Text(
                                    "START",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Color(0xFF26905B).withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          onTap: () {}, // Handle your onTap
                          child: Ink(
                            child: const Icon(
                              BeeAppIcons.music,
                              color: Color(0xFF027B76),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: -24,
            left: 15,
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              alignment: Alignment.center,
              child: RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    height: 48,
                    width: 48,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: PolygonShapeBorder(
                            sides: 6,
                            cornerRadius: 20.toPercentLength,
                            cornerStyle: CornerStyle.rounded)),
                    child: const Icon(BeeAppIcons.flower,
                        color: Color(0xFFF9B700)),
                  )),
            ))
      ]),
    ));
  }
}
