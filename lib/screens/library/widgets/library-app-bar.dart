import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../models/app_user.dart';
import '../../../utils/authentication.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LibraryAppBar extends StatefulWidget implements PreferredSizeWidget {
  const LibraryAppBar({Key? key}) : super(key: key);

  @override
  State<LibraryAppBar> createState() => _LibraryAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

class _LibraryAppBarState extends State<LibraryAppBar> {
  @override
  Widget build(BuildContext context) {
    final AppUser? user = Authentication.appUser;
    String avatar = "jkgfds";
    if (user != null) {
      avatar = user.avatar;
    }
    
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
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
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
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
        ],
      ),
    );
  }
}
