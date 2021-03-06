import 'package:flutter/material.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/providers/bookcase_provider.dart';
import 'package:library_online_application/providers/reading_space_provider.dart';
import 'package:library_online_application/screens/app-intro/app_intro_screen.dart';
import 'package:library_online_application/screens/bookcase/bookcase_screen.dart';
import 'package:library_online_application/screens/flaskcard/flaskcard_screen.dart';
import 'package:library_online_application/screens/library/library_screen.dart';
import 'package:library_online_application/screens/pomodoro/pomodoro_screen.dart';
import 'package:library_online_application/screens/reading-space/reading_space_screen.dart';
import 'package:library_online_application/utils/authentication.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BookcaseProvider>(
            create: (_) => new BookcaseProvider()),
        ChangeNotifierProvider<ReadingSpaceProvider>(
            create: (_) => new ReadingSpaceProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
      // home: const MyHomePage(),
      home: const AppIntro(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Widget> _screens = <Widget>[
    LibraryScreen(),
    BookcaseScreen(),
    ReadingSpaceScreen(),
    PomodoroScreen(),
    FlaskCardScreen()
  ];
  static const List _icons = [
    BeeAppIcons.library_icon,
    BeeAppIcons.book,
    BeeAppIcons.reading_space,
    BeeAppIcons.light_bulb,
    BeeAppIcons.flash_card
  ];
  static const List _tabs = [
    "LIBRARY",
    "SHELF",
    "READING",
    "POMODORO",
    "FLASHCARD"
  ];
  int _selectedIndex = 0; //New

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          children: _screens,
          index: _selectedIndex,
        ),
        extendBody: true,
        bottomNavigationBar: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  offset: Offset(0, -4),
                  blurRadius: 16,
                )
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.from(_tabs.asMap().entries.map((e) => NavItem(
                    index: e.key,
                    selectedIndex: _selectedIndex,
                    onTab: _onItemTapped,
                    icon: _icons[e.key],
                    title: _tabs[e.key]))),
              ),
            )));
  }
}

class NavItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function onTab;
  final IconData icon;
  final String title;

  const NavItem(
      {Key? key,
      required this.index,
      required this.selectedIndex,
      required this.onTab,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTab(index);
        },
        child: index == selectedIndex
            ? Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 183, 0, 1),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 12, bottom: 12),
                child: Row(children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
              )
            : Icon(
                icon,
                color: const Color.fromRGBO(191, 191, 191, 1),
              ));
  }
}
