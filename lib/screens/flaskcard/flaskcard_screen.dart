import 'package:flutter/material.dart';
class FlaskCardScreen extends StatefulWidget {
  const FlaskCardScreen({ Key? key }) : super(key: key);

  @override
  State<FlaskCardScreen> createState() => _FlaskCardScreenState();
}

class _FlaskCardScreenState extends State<FlaskCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("flaskcard"),
    );
  }
}