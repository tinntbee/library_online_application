import 'package:flutter/material.dart';

class SearchScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchScreenAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
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
    );
  }
}
