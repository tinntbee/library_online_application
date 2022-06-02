import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_online_application/widgets/statefull/translator_dialog.dart';

import '../../icons/bee_app_icons.dart';

class Translator extends StatefulWidget {
  const Translator({Key? key}) : super(key: key);

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  var _translatorDialog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _translatorDialog = StreamBuilder<dynamic>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return TranslatorDialog();
    });
  }

  Future<void> _showDialog() async {
    var a = await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.1),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return _translatorDialog;
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
    return SizedBox(
      width: 40,
      height: 40,
      child: Opacity(
        opacity: 0.5,
        child: Material(
          color: const Color(0xFF185F75),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {
              _showDialog();
            }, // Handle your onTap
            child: Ink(
              child: const Icon(BeeAppIcons.translator, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
