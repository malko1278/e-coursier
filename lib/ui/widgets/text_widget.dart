
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final Alignment alignement;
  final double topMarg;
  final double leftMarg;
  final double rightMarg;
  final double bottomMarg;
  final String title;
  final TextAlign alignText;
  final double textSize;
  final Color textColor;
  final FontWeight textFont;

  const TextWidget({
    required this.alignement,
    required this.topMarg,
    required this.leftMarg,
    required this.rightMarg,
    required this.bottomMarg,
    required this.title,
    required this.alignText,
    required this.textSize,
    required this.textColor,
    required this.textFont,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: alignement,
      margin: EdgeInsets.only(left: leftMarg, top: topMarg, right: rightMarg, bottom: bottomMarg,),
      child: Text(
        title,
        textAlign: alignText,
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: textFont,
        ),
      ),
    );
  }
}