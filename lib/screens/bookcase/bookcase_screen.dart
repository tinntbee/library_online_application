import 'package:flutter/material.dart';
import 'package:library_online_application/screens/bookcase/widgets/books-in-book-case.dart';
import 'package:library_online_application/screens/bookcase/widgets/notes-in-book-case.dart';

class BookcaseScreen extends StatefulWidget {
  const BookcaseScreen({Key? key}) : super(key: key);

  @override
  State<BookcaseScreen> createState() => _BookcaseScreenState();
}

class _BookcaseScreenState extends State<BookcaseScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.network(
          "https://scontent.fsgn5-14.fna.fbcdn.net/v/t39.30808-6/257389955_3181217128869842_8105881929471881933_n.jpg?stp=dst-jpg_p960x960&_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=Hndjelty0UcAX-hHOUh&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT_7NzWHavoVBmafRXgU0jeC5L9dfxFVpDigysFn1R2kVg&oe=6294F52E",
          width: double.infinity,
          height: 270,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: double.infinity,
          child: ListView(
              // physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    SizedBox(height: 170),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      height: (MediaQuery.of(context).size.height - 160),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(80))),
                      clipBehavior: Clip.hardEdge,
                      child: const DefaultTabController(
                        length: 2,
                        child: Scaffold(
                          appBar: PreferredSize(
                              child: TabBar(
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                labelStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                labelColor: Color(0xFF027B76),
                                unselectedLabelColor: Color(0xFFA4A4A4),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: Color(0xFF027B76),
                                isScrollable: true,
                                tabs: [
                                  Tab(
                                    key: Key("books-tab"),
                                    text: "Books",
                                  ),
                                  Tab(
                                    key: Key("notes-tab"),
                                    text: "Notes",
                                  ),
                                ],
                              ),
                              preferredSize: Size(24, 24)),
                          body: TabBarView(
                            key: Key("books"),
                            children: [
                              BooksInBookcase(),
                              NotesInBookcase(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        )
      ]),
    );
  }
}
