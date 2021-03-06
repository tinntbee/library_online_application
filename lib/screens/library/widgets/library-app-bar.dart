import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';

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
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

class _LibraryAppBarState extends State<LibraryAppBar> {
  AppUser? user = Authentication.appUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Authentication.appUser;
    print(Authentication.appUser);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const Icon(
                BeeAppIcons.menu,
                size: 20,
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
                    Authentication.appUser!.avatar!,
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
