import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/api/categories_api.dart';
import 'package:library_online_application/models/app_user.dart';
import 'package:library_online_application/models/category.dart';
import 'package:library_online_application/utils/authentication.dart';
import 'package:library_online_application/widgets/statefull/book_by_categories.dart';
import 'package:library_online_application/widgets/statefull/book_for_you.dart';
import 'package:library_online_application/widgets/statefull/book_trending.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    final AppUser? user = Authentication.appUser;
    String avatar = "jkgfds";
    if (user != null) {
      avatar = user.avatar;
    }

    // Future<void> getBook() async {
    //   print(await BookApi.getBookByTag("61b982603cd1052a8febe8fc"));
    // }

    // getBook();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140), // Set this height
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.dashboard_rounded,
                      color: Color.fromRGBO(109, 109, 109, 1),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "LIBRARY",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(109, 109, 109, 1)),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Authentication.signOut(context: context);
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Image.network(
                          avatar,
                          width: 34,
                          height: 34,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.search,
                          color: Color.fromRGBO(191, 191, 191, 1),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1)),
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [BookForYou(), BookTrending(), BookByCategories()],
      ),
      backgroundColor: Colors.white,
    );
  }
}
