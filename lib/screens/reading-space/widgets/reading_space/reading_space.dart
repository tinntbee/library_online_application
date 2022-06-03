import 'package:flutter/material.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/note_space.dart';
import 'package:library_online_application/screens/search-in-library/widgets/result_search_bar.dart';
import 'package:library_online_application/widgets/statefull/count_down.dart';
import 'package:library_online_application/widgets/statefull/translator.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingSpace extends StatefulWidget {
  const ReadingSpace({Key? key}) : super(key: key);

  @override
  State<ReadingSpace> createState() => _ReadingSpaceState();
}

class _ReadingSpaceState extends State<ReadingSpace> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final _pdfController = PdfViewerController();
  int _pageNumber = 0;
  int _pageCount = 0;

  var countDown;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pdfController.addListener(_pdfChange);
    countDown = StreamBuilder<dynamic>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return CountDown();
    });
  }

  void _pdfChange({String? property}) {
    if (property != null) {
      switch (property) {
        case "pageCount":
          _pageCountChanged();
          break;
        case "pageChanged":
          _pageNumberChanged();
          break;
        default:
      }
    }
  }

  void _pageCountChanged({String? property}) {
    if (_pdfController.pageCount != null &&
        _pageCount != _pdfController.pageCount) {
      setState(() {
        _pageCount = _pdfController.pageCount;
      });
    }
  }

  void _pageNumberChanged({String? property}) {
    if (_pdfController.pageNumber != null &&
        _pageNumber != _pdfController.pageNumber) {
      setState(() {
        _pageNumber = _pdfController.pageNumber;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReadingSpaceAppBar(),
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.only(top: 68),
                child: SfPdfViewer.network(
                  "https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/books%2Fpdf%2FTin%20Nguyen%20Trung%20-%20CV%20Fresher%20Front-end%20Software%20Engineer%20-%C4%91%C3%A3%20b%E1%BA%A3o%20v%E1%BB%87-ver1641914858683.pdf?alt=media&token=0f3dc075-a6e1-4300-94d8-a8cee43b1d5a",
                  key: _pdfViewerKey,
                  password: "1234",
                  canShowScrollHead: false,
                  scrollDirection: PdfScrollDirection.vertical,
                  pageSpacing: 0,
                  controller: _pdfController,
                ),
              ),
              Positioned(
                  top: 100,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFF000000).withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _pageNumber.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          "/" + _pageCount.toString(),
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  )),
              Positioned(top: 100, right: 4, child: countDown),
              Positioned(top: 150, right: 4, child: Translator()),
              NoteSpace()
            ],
          )),
    );
  }
}

class ReadingSpaceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ReadingSpaceAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 4),
            blurRadius: 16,
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    onTap: () {
                      Navigator.pop(context);
                    }, // Handle your onTap
                    child: Ink(
                      child: const Icon(
                        BeeAppIcons.arrow_left,
                        color: Color(0xFF6D6D6D),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Reading Space",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6D6D6D)),
                )
              ],
            ),
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    onTap: () {
                      Navigator.pop(context);
                    }, // Handle your onTap
                    child: Ink(
                      child: const Icon(BeeAppIcons.note,
                          color: Color(0xFF6D6D6D)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    onTap: () {
                      Navigator.pop(context);
                    }, // Handle your onTap
                    child: Ink(
                      child: const Icon(BeeAppIcons.close,
                          color: Color(0xFF6D6D6D)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
