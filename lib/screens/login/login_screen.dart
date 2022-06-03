import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_online_application/clippers/book_mark_clipper.dart';
import 'package:library_online_application/main.dart';
import 'package:library_online_application/models/app_user.dart';
import 'package:library_online_application/utils/authentication.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    bool visible = true;
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
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 143,
                        height: 103,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF9B700),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      Positioned(
                          right: -10,
                          bottom: -20,
                          child: Container(
                            width: 71,
                            height: 61,
                            decoration: const BoxDecoration(
                                color: Color(0xFFC32460),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipPath(
                        clipper: BookMarkClipper(),
                        child: Container(
                          height: 386,
                          width: 281,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.only(
                                top: 52, left: 22, right: 22),
                            child: Column(
                              children: [
                                const Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0D6D75)),
                                ),
                                const Text(
                                  "with Bee Library account",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF8F9899)),
                                ),
                                const SizedBox(
                                  height: 23,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 33,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF).withOpacity(0.1),
                                            offset: Offset(0, 2),
                                            blurRadius: 8)
                                      ]),
                                  child: const TextField(
                                    obscureText: false,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF0D6D75),
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 8.0, 7.0, 10.0),
                                      hintText: "Username",
                                      hintStyle:
                                          TextStyle(color: Color(0xFF8F9899)),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                StatefulBuilder(builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(right: 10),
                                      height: 33,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xFF)
                                                    .withOpacity(0.1),
                                                offset: Offset(0, 2),
                                                blurRadius: 8)
                                          ]),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              obscureText: visible,
                                              enableSuggestions: false,
                                              validator: (String? value) {
                                                if (value!.trim().isEmpty) {
                                                  return 'Password is required';
                                                }
                                              },
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF0D6D75),
                                                  fontWeight: FontWeight.w400),
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 7.0, 10.0),
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                    color: Color(0xFF8F9899)),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(
                                                () => visible = !visible,
                                              );
                                            },
                                            child: Builder(
                                              builder: (context) => visible
                                                  ? const Icon(
                                                      Icons.visibility_outlined,
                                                      size: 20,
                                                      color: Color(0xFF0F6B75),
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .visibility_off_outlined,
                                                      size: 20,
                                                      color: Color(0xFF0F6B75),
                                                    ),
                                            ),
                                          )
                                        ],
                                      ));
                                }),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 5, top: 5),
                                  child: const Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF0F6B75),
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                const Text(
                                  "or Sign in with",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF8F9899)),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    FutureBuilder(
                                      future: Authentication.initializeFirebase(
                                          context: context),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return Text(
                                              'Error initializing Firebase');
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.done) {}
                                        return Expanded(
                                            child: Container(
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFFF4566),
                                                    Color(0xFFC22460),
                                                  ],
                                                  begin: FractionalOffset(
                                                      1.0, 0.0),
                                                  end: FractionalOffset(
                                                      0.0, 0.0),
                                                  stops: [0.0, 1.0],
                                                  tileMode: TileMode.clamp),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          clipBehavior: Clip.hardEdge,
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () async {
                                                setState(() {
                                                  _isSigningIn = true;
                                                });

                                                AppUser? user =
                                                    await Authentication
                                                        .signInWithGoogle(
                                                            context: context);

                                                setState(() {
                                                  _isSigningIn = false;
                                                });

                                                if (user != null) {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHomePage(),
                                                    ),
                                                  );
                                                }
                                              }, // Handle your onTap
                                              child: Ink(
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  height: 35,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "Google",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Image.asset(
                                                          'assets/images/png/google_logo.png')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ));
                                      },
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                        child: Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1D71A1),
                                                Color(0xFF176075),
                                              ],
                                              begin: FractionalOffset(1.0, 0.0),
                                              end: FractionalOffset(0.0, 0.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      clipBehavior: Clip.hardEdge,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {}, // Handle your onTap
                                          child: Ink(
                                            child: Container(
                                              height: 35,
                                              padding: EdgeInsets.all(8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Facebook",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                  Image.asset(
                                                      'assets/images/png/facebook_logo.png')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                RichText(
                                    softWrap: true,
                                    text: const TextSpan(
                                        text: "I agree to ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF0D6D75)),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "app Privacy, User Agreement, T&Cs",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                          bottom: -28,
                          left: 112,
                          child: Container(
                            width: 57,
                            height: 57,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            clipBehavior: Clip.hardEdge,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePage()),
                                  );
                                },
                                child: Ink(
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/png/arrow_right_icon.png',
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  )
                ],
              )
            ],
          )),
    );
  }
}
