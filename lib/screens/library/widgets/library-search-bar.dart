import 'dart:math';

import 'package:flutter/material.dart';

class LibrarySearchBar extends StatefulWidget {
  const LibrarySearchBar({Key? key}) : super(key: key);

  @override
  State<LibrarySearchBar> createState() => _LibrarySearchBarState();
}

class _LibrarySearchBarState extends State<LibrarySearchBar> {
  final searchController = TextEditingController();
  bool searchOnFocus = false;
  bool searchIsValued = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
    searchController.addListener(() {
      if (searchController.text.isNotEmpty & !searchIsValued) {
        setState(() {
          searchIsValued = true;
        });
        return;
      }
      if (searchController.text.isEmpty & searchIsValued) {
        setState(() {
          searchIsValued = false;
        });
        return;
      }
    });
  }

  void _handleClearSearch() {
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tags = [
      "Truyen ngan",
      "Khoa hoc",
      "Cong nghe",
      "Tam ly hoc",
      "Lich su",
      "Tieu thuyet"
    ];

    return SliverPersistentHeader(
      floating: true,
      pinned: false,
      delegate: SliverAppBarDelegate(
          minHeight: searchOnFocus ? 155.0 : 55.0,
          maxHeight: searchOnFocus ? 155.0 : 55.0,
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
                            style: TextStyle(
                                color: Color.fromRGBO(109, 109, 109, 1)),
                            focusNode: focusNode,
                            controller: searchController,
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
                  searchOnFocus
                      ? Container(
                          width: double.infinity,
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
                              Wrap(
                                children: tags
                                    .map((e) => Container(
                                          margin: const EdgeInsets.all(3),
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: const Color(0xFF6D6D6D)
                                                  .withOpacity(0.1)),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap:
                                                  () async {}, // Handle your onTap
                                              child: Ink(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8,
                                                      horizontal: 10),
                                                  child: Text(
                                                    e,
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color:
                                                            Color(0xFF6D6D6D)),
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
                        )
                      : Container()
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
