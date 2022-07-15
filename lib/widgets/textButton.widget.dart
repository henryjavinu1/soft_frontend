

import 'package:flutter/material.dart';


class TextButtons extends StatelessWidget {
  final String name;
  final String route;
  final double width;
  final double fontSize;

  const TextButtons(
      {Key? key,
      required this.name,
      required this.route, required this.width, required this.fontSize,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: size.width * width,
          padding: const EdgeInsets.all(25),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, color: const Color(0xff525252)),
          )),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xffD9D9D9)),
      ),
    );
  }
}
