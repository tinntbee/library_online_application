import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/models/book.dart';
import 'package:library_online_application/screens/search-in-library/widgets/book_item_search.dart';
import 'package:library_online_application/screens/search-in-library/widgets/result_search_bar.dart';

class SearchInLibrary extends StatefulWidget {
  SearchInLibrary({Key? key, required this.searchText}) : super(key: key);
  String searchText;
  @override
  State<SearchInLibrary> createState() => _SearchInLibraryState();
}

class _SearchInLibraryState extends State<SearchInLibrary> {
  final _searchController = TextEditingController();
  late String _searchText;
  List<Book> _books = [];
  bool _bookLoading = true;

  void _searchFieldSubmit(String idTag) {
    //search, tagId, filter, sort, page, size
    fetchSearchBooks(_searchController.text, idTag);
  }

  Future<void> fetchSearchBooks(String search, String idTag) async {
    setState(() {
      _bookLoading = true;
    });
    List<Book> books = await BookApi.searchBooks(search, idTag);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _books = books;
      _bookLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchText = widget.searchText;
    _searchController.text = _searchText;
    fetchSearchBooks(_searchText, "");
  }

  PreferredSizeWidget SearchScreenAppBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(109, 109, 109, 1),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "LIBRARY",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(109, 109, 109, 1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchScreenAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // persistent header
          ResultSearchBar(
            submit: _searchFieldSubmit,
            searchController: _searchController,
          ),
          SliverToBoxAdapter(
              child: _bookLoading ? booksLoadingWidget : listBooks()),
        ],
      ),
    );
  }

  final booksLoadingWidget = Container(
    width: double.infinity,
    height: 200,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCubeGrid(
            color: Color(0xFFBFBFBF).withOpacity(0.5),
            size: 110,
          ),
        ],
      ),
    ),
  );

  Widget listBooks() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _books
                            .asMap()
                            .entries
                            .map((e) => e.key % 2 == 0
                                ? BookItemSearch(
                                    image: e.value.image!,
                                    name: e.value.name,
                                    author: e.value.author ?? "-",
                                  )
                                : SizedBox())
                            .toList())),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _books
                            .asMap()
                            .entries
                            .map((e) => e.key % 2 == 1
                                ? BookItemSearch(
                                    image: e.value.image!,
                                    name: e.value.name,
                                    author: e.value.author ?? "-",
                                  )
                                : SizedBox())
                            .toList())),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xFF6D6D6D).withOpacity(0.1)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {}, // Handle your onTap
                  child: Ink(
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Text(
                        "LOAD MORE",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6D6D6D)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
