import 'package:flutter/material.dart';
import 'package:library_online_application/api/note_api.dart';
import 'package:library_online_application/models/book_in_bookcase.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/providers/bookcase_provider.dart';
import 'package:library_online_application/providers/reading_space_provider.dart';
import 'package:library_online_application/res/stackstacked_card_carousel/stacked_card_carousel.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_books/reading_book_item.dart';
import 'package:provider/provider.dart';

class ReadingBooks extends StatefulWidget {
  final List<Note> notesActive;
  const ReadingBooks({Key? key, required this.notesActive}) : super(key: key);

  @override
  State<ReadingBooks> createState() => _ReadingBooksState();
}

class _ReadingBooksState extends State<ReadingBooks> {
  final readingSpaceProvider = ReadingSpaceProvider();
  int _itemActive = 0;
  void setItemActive(index) {
    print(index);
    setState(() {
      _itemActive = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("FROM YOUR BOOK\nSHELF",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6D6D),
                    height: 1.2),
                maxLines: 2),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                "Warnning: Opening too many note-task \ncan degrade performance !!",
                style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA4A4A4),
                    height: 1.2),
                maxLines: 2),
          ),
          Expanded(
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      widget.notesActive.length > 0
                          ? StackedCardCarousel(
                              type: StackedCardCarouselType.cardsStack,
                              initialOffset: 40,
                              spaceBetweenItems: 350,
                              onPageChanged: (index) {
                                setItemActive(index);
                              },
                              items: widget.notesActive
                                  .asMap()
                                  .entries
                                  .map((e) => ReadingBookItem(
                                        note: e.value,
                                        isActive: _itemActive == e.key,
                                      ))
                                  .toList(),
                            )
                          : SizedBox(),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(254, 254, 254, 0),
                                    Color.fromRGBO(254, 254, 254, 1),
                                  ],
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                          )),
                      Positioned(
                          bottom: 100,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: const Color(0xFFEB5757),
                                        boxShadow: const [
                                          BoxShadow(
                                            spreadRadius: 0,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.15),
                                            offset: Offset(0, 4),
                                            blurRadius: 8,
                                          )
                                        ],
                                        border:
                                            Border.all(color: Colors.white)),
                                    width: 95,
                                    height: 30,
                                    clipBehavior: Clip.hardEdge,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Provider.of<ReadingSpaceProvider>(
                                                  context,
                                                  listen: false)
                                              .closeAll();
                                        }, // Handle your onTap
                                        child: Ink(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "CLEAR ALL",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        )),
                                      ),
                                    ))),
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}
