import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/widgets/statefull/count_down_dialog.dart';
import 'package:morphable_shape/morphable_shape.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  Future<void> _showDialog() async {
    var a = await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return CountDownDialog();
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
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: 40,
        width: 40,
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
                  width: 2,
                  color: Color(0xFFF9B700),
                  begin: 0.toPercentLength,
                  end: 80.toPercentLength,
                  strokeJoin: StrokeJoin.round,
                  strokeCap: StrokeCap.round,
                ),
                cornerRadius: 10.toPercentLength,
                cornerStyle: CornerStyle.rounded)),
        child: Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {
              _showDialog();
            }, // Handle your onTap
            child: Ink(),
          ),
        ),
      ),
    );
  }
}
