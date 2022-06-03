import 'dart:math';

import 'package:flutter/material.dart';
import 'package:library_online_application/screens/search-in-library/search_in_library.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.handleSearch}) : super(key: key);
  final Function handleSearch;
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
    widget.handleSearch("");
  }

  @override
  Widget build(BuildContext context) {
    void _handleOnChange(String value) {
      widget.handleSearch(value);
    }

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
          minHeight: 55.0,
          maxHeight: 55.0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
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
                            onChanged: (value) {
                              _handleOnChange(value);
                            },
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
