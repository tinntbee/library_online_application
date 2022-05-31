import 'package:flutter/material.dart';
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
                  Container(
                    height: 120,
                    width: 120,
                    clipBehavior: Clip.hardEdge,
                    decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/defaults%2Favatar-default%2Favatar-default-03.png?alt=media&token=34fc5a2a-d1ab-4b52-9d01-5d01007cbb7a"),
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
                  ),
                  const Icon(BeeAppIcons.navigate_right,
                      size: 40, color: Color(0xFFF9B700)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: double.infinity,
                  height: 57,
                  color: Color(0xFF26905B).withOpacity(0.1),
                  child: Row(children: [
                    Container(
                      child: Row(
                        children: [
                          TextFormField(
                            initialValue: "60",
                          )
                        ],
                      ),
                    )
                  ]))
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
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: PolygonShapeBorder(
                            sides: 6,
                            cornerRadius: 20.toPercentLength,
                            cornerStyle: CornerStyle.rounded)),
                  )),
            ))
      ]),
    ));
  }
}
