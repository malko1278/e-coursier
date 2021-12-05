
import 'package:flutter/material.dart';

import 'package:social_navig/ui/widgets/text_widget.dart';

class DateSelector extends StatelessWidget {
  final double heigWid;
  final double leftMarg;
  final double topMarg;
  final double rigMarg;
  final double bottMarg;
  final double circular;
  final double bordWidth;
  final TextWidget textWidget;
  final Function () onPressed;
  const DateSelector({
    required this.heigWid,
    required this.leftMarg,
    required this.topMarg,
    required this.rigMarg,
    required this.bottMarg,
    required this.circular,
    required this.bordWidth,
    required this.textWidget,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // color: thirdColor,
        height: heigWid,
        margin: EdgeInsets.only(
          left: leftMarg,
          top: topMarg,
          right: rigMarg,
          bottom: bottMarg,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circular,),
          shape: BoxShape.rectangle,
          border: Border.all(
            width: bordWidth,
            color: Colors.grey.shade500,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            textWidget,
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}