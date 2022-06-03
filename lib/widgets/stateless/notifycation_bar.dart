import 'package:flutter/material.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';

SnackBar NotificationSnackBar(String status, String message, Color color){
  return SnackBar(
      content: Row(children: [
        Icon(
            status == "success"
                ? BeeAppIcons.success
                : status == "error"
                    ? BeeAppIcons.error
                    : BeeAppIcons.warning,
            color: Colors.white),
        SizedBox(
          width: 5,
        ),
        Text(
          message,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        )
      ]),
      duration: Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: color,
    );
}