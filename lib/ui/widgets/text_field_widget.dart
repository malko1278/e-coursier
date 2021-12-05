
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final double leftPad;
  final double rightPad;
  final double leftMarg;
  final double topMarg;
  final double rightMarg;
  final double bordRad;
  final Color colorElt;
  final Color borderColorElt;
  final double borderWidth;
  final TextEditingController eltControler;
  final TextInputType textKeyBoard;
  final Function (String) onchangText;
  final InputBorder inputBorderText;
  final String labelText;
  final String hintText;

  const TextFieldWidget({
    required this.leftPad,
    required this.rightPad,
    required this.leftMarg,
    required this.topMarg,
    required this.rightMarg,
    required this.bordRad,
    required this.colorElt,
    required this.borderColorElt,
    required this.borderWidth,
    required this.eltControler,
    required this.textKeyBoard,
    required this.onchangText,
    required this.inputBorderText,
    required this.labelText,
    required this.hintText,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: leftPad, right: rightPad),
      margin: EdgeInsets.only(left: leftMarg, right: rightMarg, top: topMarg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(bordRad),
        color: colorElt,
        border: Border.all(
          color: borderColorElt,
          width: borderWidth,
        ),
      ),
      child: TextField(
        controller: eltControler,
        keyboardType: textKeyBoard,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        onChanged: onchangText,
        decoration: InputDecoration(
          border: inputBorderText,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black26,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
          /*suffixIcon: FaIcon(
            FontAwesomeIcons.pencilAlt,
            size: 15.0,
            // color: Colors.green,
          ),*/
        ),
      ),
    );
  }
}