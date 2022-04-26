import 'package:flutter/material.dart';
import 'package:library_online_application/clippers/book_mark_clipper.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(2, 123, 118, 0.7),
                Color.fromRGBO(24, 95, 117, 0.7),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 143,
                  height: 103,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF9B700),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Positioned(
                    right: -10,
                    bottom: -20,
                    child: Container(
                      width: 71,
                      height: 61,
                      decoration: const BoxDecoration(
                          color: Color(0xFFC32460),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Book with Bee",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "Reading is like honey bees looking for flowers, must work hard and diligently",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ClipPath(
              clipper: BookMarkClipper(),
              child: Container(
                height: 386,
                width: 281,
                child: Container(),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
