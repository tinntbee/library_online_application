import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/widgets/statefull/count_down_dialog.dart';
import 'package:morphable_shape/morphable_shape.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);
  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> with WidgetsBindingObserver {
  var countDownDialog;
  bool _isStart = false;
  int _timePeriod = 0;
  int _endTime = DateTime.now().millisecondsSinceEpoch;
  CountdownTimerController? _countDownController;
  final _pomodoroWarningSnackBar = SnackBar(
    content: Row(children: const [
      Icon(BeeAppIcons.warning, color: Colors.white),
      Text(
        "You left when Pomodoro is starting!",
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      )
    ]),
    duration: Duration(seconds: 4),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    backgroundColor: Color(0xFFF9B700),
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        _countDownController?.disposeTimer();
        ScaffoldMessenger.of(context).showSnackBar(_pomodoroWarningSnackBar);
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        _countDownController?.disposeTimer();
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        _countDownController?.disposeTimer();
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    countDownDialog = StreamBuilder<dynamic>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return CountDownDialog();
    });
    _countDownController =
        CountdownTimerController(endTime: _endTime, onEnd: _timeOut);
    _countDownController?.disposeTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _showDialog() async {
    _countDownController?.disposeTimer();
    var a = await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return countDownDialog;
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
    _countDownController?.endTime =
        DateTime.now().millisecondsSinceEpoch + 30 * 1000;
    _countDownController?.start();
  }

  void _timeOut() {
    if (_isStart) {
      showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return pomodoroDialog();
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
  }

  Widget pomodoroDialog() {
    return Center(
        child: Material(
            color: Colors.transparent,
            child: Container(
              height: 320,
              width: MediaQuery.of(context).size.width - 30,
              padding:
                  EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Congratulation!!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF027B76))),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF9B700).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            BeeAppIcons.flower,
                            color: Color(0xFFF9B700),
                            size: 84,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("You got more",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFF9B700))),
                            Text("30 Flowers!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFF9B700)))
                          ],
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                        "Congratulations on completing the Pomodoro in 30 minutes, now you have 5 minutes to relax before moving on to the next Pomodoro.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFA4A4A4))),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10),
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
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          _showDialog();
                        }, // Handle your onTap
                        child: Ink(
                            width: double.infinity,
                            height: double.infinity,
                            child: const Center(
                              child: Text(
                                "START NEW POMODORO",
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
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Container(
        height: 40,
        width: 40,
        clipBehavior: Clip.none,
        decoration: ShapeDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/defaults%2Favatar-default%2Favatar-default-03.png?alt=media&token=34fc5a2a-d1ab-4b52-9d01-5d01007cbb7a"),
              fit: BoxFit.contain,
            ),
            shape: PolygonShapeBorder(
                sides: 6,
                cornerRadius: 10.toPercentLength,
                cornerStyle: CornerStyle.rounded)),
        child: CountdownTimer(
          controller: _countDownController,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return Container(
                height: 40,
                width: 40,
                clipBehavior: Clip.hardEdge,
                decoration: ShapeDecoration(
                    shape: PolygonShapeBorder(
                        sides: 6,
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
              );
            }
            int process = (time.sec! ~/ 0.30);
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 40,
              width: 40,
              clipBehavior: Clip.hardEdge,
              decoration: ShapeDecoration(
                  shape: PolygonShapeBorder(
                      sides: 6,
                      border: DynamicBorderSide(
                        style: BorderStyle.solid,
                        width: 2,
                        color: Color(0xFFF9B700),
                        begin: 0.toPercentLength,
                        end: process.toPercentLength,
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
            );
          },
        ),
      ),
    );
  }
}
