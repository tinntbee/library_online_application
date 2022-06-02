import 'dart:math';

import 'package:flutter/material.dart';
import 'package:library_online_application/api/tag_api.dart';
import 'package:library_online_application/models/tag.dart';
import 'package:library_online_application/screens/search-in-library/search_in_library.dart';

class ResultSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final Function submit;
  const ResultSearchBar(
      {Key? key, required this.searchController, required this.submit})
      : super(key: key);
  @override
  State<ResultSearchBar> createState() => _ResultSearchBarState();
}

class _ResultSearchBarState extends State<ResultSearchBar> {
  bool searchOnFocus = false;
  bool searchIsValued = false;
  FocusNode focusNode = FocusNode();
  String _idTagCurrent = "";
  List<Tag> tags = [];

  @override
  void initState() {
    super.initState();
    getTags();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          searchOnFocus = true;
        });
      } else {
        setState(() {
          searchOnFocus = false;
        });
      }
    });
    widget.searchController.addListener(() {
      if (widget.searchController.text.isNotEmpty & !searchIsValued) {
        setState(() {
          searchIsValued = true;
        });
        return;
      }
      if (widget.searchController.text.isEmpty & searchIsValued) {
        setState(() {
          searchIsValued = false;
        });
        return;
      }
    });
  }

  void _handleClearSearch() {
    widget.searchController.clear();
  }

  void _handleNavigateToSearchScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SearchInLibrary(
        searchText: '',
      ),
    ));
  }

  Future<void> getTags() async {
    List<Tag> listTags = await TagApi.getTags();
    setState(() {
      tags = listTags;
    });
  }

  void _changeTagCurrent(String? tagId) {
    if (tagId?.compareTo(_idTagCurrent) == 0) {
      setState(() {
        _idTagCurrent = "";
      });
    } else {
      setState(() {
        _idTagCurrent = tagId ?? "";
      });
    }
    widget.submit(tagId);
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: false,
      delegate: SliverAppBarDelegate(
          minHeight: 155.0,
          maxHeight: 155.0,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(247, 247, 247, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.search,
                            color: searchOnFocus
                                ? Color(0xFF6D6D6D)
                                : Color.fromRGBO(191, 191, 191, 1),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              widget.submit(_idTagCurrent);
                            },
                            style: TextStyle(
                                color: Color.fromRGBO(109, 109, 109, 1)),
                            focusNode: focusNode,
                            controller: widget.searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(191, 191, 191, 1)),
                            ),
                          ),
                        ),
                        searchOnFocus & searchIsValued
                            ? GestureDetector(
                                onTap: _handleClearSearch,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.close,
                                    color: searchOnFocus
                                        ? Color(0xFF6D6D6D)
                                        : Color.fromRGBO(191, 191, 191, 1),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.only(bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "# Book Tags",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6D6D6D)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                            child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: ListView(
                            children: [
                              Wrap(
                                children: tags
                                    .map((e) => Container(
                                          margin: const EdgeInsets.all(3),
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: e.id == _idTagCurrent
                                                  ? const Color(0xFFA4A4A4)
                                                  : const Color(0xFF6D6D6D)
                                                      .withOpacity(0.1)),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {
                                                _changeTagCurrent(e.id);
                                              }, // Handle your onTap
                                              child: Ink(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8,
                                                      horizontal: 10),
                                                  child: Text(
                                                    e.name!,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: e.id ==
                                                                _idTagCurrent
                                                            ? Colors.white
                                                            : Color(
                                                                0xFF6D6D6D)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ))
                ],
              ))),
    );
  }
}

// defining delegate for sliverpersistendheader
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double? minHeight;
  final double? maxHeight;
  final Widget? child;
  @override
  double get minExtent => minHeight!;
  @override
  double get maxExtent => max(maxHeight!, minHeight!);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
