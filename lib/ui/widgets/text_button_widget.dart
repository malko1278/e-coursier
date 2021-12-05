
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';

class TextButtonWidget extends StatelessWidget {
  final double widthCont;
  final double leftPad;
  final double topPad;
  final double bottomPad;
  final String title;
  final TextAlign alignText;
  final double textSize;
  final Color textColor;
  final FontWeight textFont;
  final int indice;
  final Function () actionMenu;

  const TextButtonWidget({
    required this.widthCont,
    required this.leftPad,
    required this.topPad,
    required this.bottomPad,
    required this.title,
    required this.alignText,
    required this.textSize,
    required this.textColor,
    required this.textFont,
    required this.indice,
    required this.actionMenu,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: () {}, // actionMenu,
      child: Container(
        width: widthCont,
        padding: EdgeInsets.only(left: leftPad, top: topPad, bottom: bottomPad,),
        child: Text(
          title,
          textAlign: alignText,
          style: TextStyle(
            fontSize: textSize,
            color: textColor,
            fontWeight: textFont,
          ),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return secondColor;
              }
              return Colors.white; // Use the component's default.
            }
        ),
      ),
    );
  }
}