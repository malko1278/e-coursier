
import 'package:flutter/material.dart';

import 'package:social_navig/util/utils.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/text_widget.dart';

class LineDateWidget extends StatelessWidget {
  final int index;
  final double leftMarg;
  final double topMarg;
  final double rightMarg;
  final double bottomMarg;
  final double elevetBtn;
  final Color borderColor;
  final String month;
  final String day;
  final int travler;

  const LineDateWidget({
    required this.index,
    required this.leftMarg,
    required this.topMarg,
    required this.rightMarg,
    required this.bottomMarg,
    required this.elevetBtn,
    required this.borderColor,
    required this.month,
    required this.day,
    required this.travler,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      // height: 60.0,
      width: _size.width,
      // color: Colors.red,
      margin: EdgeInsets.only(left: leftMarg, top: topMarg, right: rightMarg, bottom: bottomMarg),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: thirdColor,
          elevation: elevetBtn,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 55.0,
                // color: Colors.blue,
                child: TextWidget(
                  alignement: Alignment.centerRight,
                  leftMarg: 0.0,
                  topMarg: 14.0,
                  rightMarg: 0.0,
                  bottomMarg: 14.0,
                  title: '$index',
                  alignText: TextAlign.right,
                  textSize: 30.0,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
              ),
              Container(
                width: (_size.width-(105)),
                margin: EdgeInsets.only(left: 6.0, right: 15.0,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextWidget(
                          alignement: Alignment.topLeft,
                          leftMarg: 0.0,
                          topMarg: 0.0,
                          rightMarg: 0.0,
                          bottomMarg: 0.0,
                          title: month,
                          alignText: TextAlign.left,
                          textSize: 14.0,
                          textColor: Colors.black,
                          textFont: FontWeight.w500,
                        ),
                        TextWidget(
                          alignement: Alignment.topRight,
                          leftMarg: 0.0,
                          topMarg: 0.0,
                          rightMarg: 0.0,
                          bottomMarg: 0.0,
                          title: day,
                          alignText: TextAlign.right,
                          textSize: 12.0,
                          textColor: Colors.black,
                          textFont: FontWeight.w500,
                        ),
                      ],
                    ),
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 15.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: '$travler ${getRussianGender(travler)}',
                      alignText: TextAlign.right,
                      textSize: 16.0,
                      textColor: Colors.black,
                      textFont: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}