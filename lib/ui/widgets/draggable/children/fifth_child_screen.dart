
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/button/flat_button_screen.dart';

import '../../text_widget.dart';

class FifthChildScreen extends StatelessWidget {
  final ScrollController controller;
  final Function () onPressBtn1;
  final Function () onPressBtn2;
  final Function () onPressBtn3;
  final Function () onPressBtn4;
  final Function () onPressBtn5;

  const FifthChildScreen({
    required this.controller,
    required this.onPressBtn1,
    required this.onPressBtn2,
    required this.onPressBtn3,
    required this.onPressBtn4,
    required this.onPressBtn5,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView(
        controller: controller,
        children: <Widget>[
          TextWidget(
            alignement: Alignment.center,
            leftMarg: 20.0,
            topMarg: 0.0,
            rightMarg: 20.0,
            bottomMarg: .0,
            title: 'Детали заказа',
            alignText: TextAlign.center,
            textSize: 24,
            textColor: firstColor,
            textFont: FontWeight.w600,
          ),
          Container(
            margin: EdgeInsets.only(left: 27.0, top: 18.0, right: 20.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset('',),
                Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        TextWidget(
                          alignement: Alignment.topLeft,
                          leftMarg: 0.0,
                          topMarg: 0.0,
                          rightMarg: 0.0,
                          bottomMarg: .0,
                          title: 'Откуда',
                          alignText: TextAlign.left,
                          textSize: 12,
                          textColor: Colors.grey.shade500,
                          textFont: FontWeight.w500,
                        ),
                        TextWidget(
                          alignement: Alignment.topLeft,
                          leftMarg: 30.0,
                          topMarg: 22.0,
                          rightMarg: 0.0,
                          bottomMarg: .0,
                          title: 'ул. Константинопольская 25',
                          alignText: TextAlign.left,
                          textSize: 14,
                          textColor: Colors.black,
                          textFont: FontWeight.w500,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        TextWidget(
                          alignement: Alignment.topLeft,
                          leftMarg: 0.0,
                          topMarg: 0.0,
                          rightMarg: 0.0,
                          bottomMarg: .0,
                          title: 'Куда',
                          alignText: TextAlign.left,
                          textSize: 12,
                          textColor: Colors.grey.shade500,
                          textFont: FontWeight.w500,
                        ),
                        TextWidget(
                          alignement: Alignment.topLeft,
                          leftMarg: 30.0,
                          topMarg: 22.0,
                          rightMarg: 0.0,
                          bottomMarg: .0,
                          title: 'ул. Большая Константинопольская 25',
                          alignText: TextAlign.left,
                          textSize: 14,
                          textColor: Colors.black,
                          textFont: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 43.0, top: 17.0, right: 20.0,),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextWidget(
                      alignement: Alignment.topLeft,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Время:',
                      alignText: TextAlign.left,
                      textSize: 14.0,
                      textColor: firstColor,
                      textFont: FontWeight.w500,
                    ),
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: '13:00',
                      alignText: TextAlign.right,
                      textSize: 14.0,
                      textColor: Colors.grey.shade600,
                      textFont: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextWidget(
                      alignement: Alignment.topLeft,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Что везти:',
                      alignText: TextAlign.left,
                      textSize: 14.0,
                      textColor: firstColor,
                      textFont: FontWeight.w500,
                    ),
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Посылка 5 кг',
                      alignText: TextAlign.right,
                      textSize: 14.0,
                      textColor: Colors.grey.shade600,
                      textFont: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextWidget(
                      alignement: Alignment.topLeft,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Расстояние:',
                      alignText: TextAlign.left,
                      textSize: 14.0,
                      textColor: firstColor,
                      textFont: FontWeight.w500,
                    ),
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: '5 км',
                      alignText: TextAlign.right,
                      textSize: 14.0,
                      textColor: Colors.grey.shade600,
                      textFont: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextWidget(
                      alignement: Alignment.topLeft,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Цена',
                      alignText: TextAlign.left,
                      textSize: 14.0,
                      textColor: firstColor,
                      textFont: FontWeight.w500,
                    ),
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: '250 тенге',
                      alignText: TextAlign.right,
                      textSize: 14.0,
                      textColor: Colors.grey.shade600,
                      textFont: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextWidget(
            alignement: Alignment.topLeft,
            leftMarg: 30.0,
            topMarg: 22.0,
            rightMarg: 0.0,
            bottomMarg: .0,
            title: 'Предложить цену',
            alignText: TextAlign.left,
            textSize: 16,
            textColor: Colors.grey.shade700,
            textFont: FontWeight.w500,
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 20.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButtonScreen(
                  title: '350',
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 12.0,
                  rightPad: 0.0,
                  bottomPad: 12.0,
                  colorWidget: firstColor,
                  onPressed: onPressBtn1,
                  textSize: 14.0,
                ),
                FlatButtonScreen(
                  title: '450',
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 12.0,
                  rightPad: 0.0,
                  bottomPad: 12.0,
                  colorWidget: firstColor,
                  onPressed: onPressBtn2,
                  textSize: 14.0,
                ),
                FlatButtonScreen(
                  title: '550',
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 12.0,
                  rightPad: 0.0,
                  bottomPad: 12.0,
                  colorWidget: firstColor,
                  onPressed: onPressBtn3,
                  textSize: 14.0,
                ),
              ],
            ),
          ),
          ButtonScreen(
            title: 'Принять заказ',
            leftMarg: 20.0,
            topMarg: 60.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            heightWid: 65.0,
            colorWidget: firstColor,
            onPressed: onPressBtn4,
            textSize: 16.0,
            isActive: true,
          ),
          FlatButtonScreen(
            title: 'Отменить заказ',
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            colorWidget: firstColor,
            onPressed: onPressBtn5,
            textSize: 16.0,
          ),
        ],
      ),
    );
  }
}