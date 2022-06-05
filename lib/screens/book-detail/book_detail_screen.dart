import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/models/book_detail.dart';
import 'package:library_online_application/providers/bookcase_provider.dart';
import 'package:library_online_application/screens/book-detail/widgets/analyst_barl.dart';
import 'package:library_online_application/screens/book-detail/widgets/forum_tab.dart';
import 'package:library_online_application/screens/book-detail/widgets/information_tab.dart';
import 'package:library_online_application/widgets/stateless/loading.dart';
import 'package:library_online_application/widgets/stateless/notifycation_bar.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatefulWidget {
  final String bookId;
  const BookDetailScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool _isLoading = true;
  int _bookTabIndex = 0;
  late BookDetail _bookDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookDetail();
  }

  Future<void> getBookDetail() async {
    setState(() {
      _isLoading = true;
    });
    BookDetail book = await BookApi.getBookDetail(widget.bookId);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _bookDetail = book;
      _isLoading = false;
    });
  }

  Future<void> handleBuyBook(BuildContext _context) async {
    print(widget.bookId ?? "");
    int status = await Provider.of<BookcaseProvider>(_context, listen: false)
        .buyBookAndUpdate(widget.bookId ?? "");
    switch (status) {
      case 200:
        ScaffoldMessenger.of(_context).showSnackBar(NotificationSnackBar(
            "success", "Purchase success!", Color(0xFF27AE60)));
        break;
      case 210:
        ScaffoldMessenger.of(_context).showSnackBar(NotificationSnackBar(
            "warning", "Book is exit in bookcase!", Color(0xFFF9B700)));
        break;
      case 211:
        ScaffoldMessenger.of(_context).showSnackBar(NotificationSnackBar(
            "error",
            "Purchase Fail! Not have enough flower",
            Color(0xFFEB5757)));
        break;

      default:
        ScaffoldMessenger.of(_context).showSnackBar(NotificationSnackBar(
            "warning", "Something wrong!", Color(0xFFF9B700)));
        break;
    }
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF027B76).withOpacity(0.5),
          centerTitle: true,
          title: const Text(
            'Book Detail',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            padding: EdgeInsets.all(5),
            iconSize: 24,
            icon: const Icon(
              BeeAppIcons.arrow_left,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.all(5),
              iconSize: 24,
              icon: const Icon(
                BeeAppIcons.share,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ListView(
          padding: EdgeInsets.only(top: 0),
          children: _isLoading
              ? [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Loading(),
                  )
                ]
              : [
                  thumbnailBook(),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          _bookDetail.name,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF027B76)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(_bookDetail.author ?? "No Author",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFA4A4A4)))
                      ],
                    ),
                  ),
                  bookTabs(),
                  const SizedBox(
                    height: 500,
                  )
                ],
        ),
        bottomNavigationBar:
            _isLoading ? SizedBox() : bottomNavigator(context));
  }

  Widget thumbnailBook() {
    return Container(
        width: double.infinity,
        height: 450,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(38),
                      bottomRight: Radius.circular(38))),
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_bookDetail.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.3)),
                  ),
                ),
              ),
            ),
            Center(
                child: Container(
              height: 237,
              width: 163,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.2),
                        blurRadius: 8)
                  ]),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                _bookDetail.image,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(
                    child: FlutterLogo(
                      size: 80,
                    ),
                  );
                },
              ),
            )),
            Positioned(
                top: 420,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: AnalystBar(book: _bookDetail),
                )),
            Positioned(
              right: 10,
              bottom: 30,
              child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                      color: Color(0xFF000000).withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  clipBehavior: Clip.hardEdge,
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () async {}, // Handle your onTap
                          child: Ink(
                            child: const Center(
                                child: Icon(BeeAppIcons.intro,
                                    size: 30, color: Colors.white)),
                          )))),
            )
          ],
        ));
  }

  Widget bookTabs() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: double.infinity,
                height: 28,
                decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2)
                        .withOpacity(_bookTabIndex == 0 ? 1 : 0),
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _bookTabIndex = 0;
                          });
                        }, // Handle your onTap
                        child: Ink(
                          child: Center(
                            child: Text(
                              "Information",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6D6D6D).withOpacity(
                                      _bookTabIndex == 0 ? 1 : 0.5)),
                            ),
                          ),
                        ))),
              )),
              Expanded(
                  child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: double.infinity,
                height: 28,
                decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2)
                        .withOpacity(_bookTabIndex == 1 ? 1 : 0),
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _bookTabIndex = 1;
                          });
                        }, // Handle your onTap
                        child: Ink(
                          child: Center(
                            child: Text(
                              "Forum",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6D6D6D).withOpacity(
                                      _bookTabIndex == 1 ? 1 : 0.5)),
                            ),
                          ),
                        ))),
              ))
            ],
          ),
          IndexedStack(
            index: _bookTabIndex,
            children: [
              InformationTab(
                  tags: _bookDetail.tags ?? [],
                  description: _bookDetail.description ?? ""),
              ForumTab()
            ],
          )
        ],
      ),
    );
  }

  Widget bottomNavigator(BuildContext _context) {
    return Container(
      height: 64,
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                  color: Color(0xFFF9B700).withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              clipBehavior: Clip.hardEdge,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () async {}, // Handle your onTap
                      child: Ink(
                        child: const Icon(
                          BeeAppIcons.thumb_up,
                          color: Color(0xFFF9B700),
                        ),
                      )))),
          const SizedBox(
            width: 15,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFF6D6D6D).withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              clipBehavior: Clip.hardEdge,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        handleBuyBook(_context);
                      }, // Handle your onTap
                      child: Ink(
                        width: 162,
                        child: const Center(
                            child: Text("ADD TO BOOKSHELF",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6D6D6D)))),
                      )))),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFF9B700),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                clipBehavior: Clip.hardEdge,
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () async {}, // Handle your onTap
                        child: Ink(
                          child: const Center(
                              child: Text("READ NOW",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                        )))),
          ),
        ],
      ),
    );
  }
}
