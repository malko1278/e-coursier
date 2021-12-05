
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';

import '../../text_widget.dart';
import '../../text_field_widget.dart';

class FourChildScreen extends StatelessWidget {
  final ScrollController controller;
  final Function () onPressButton;

  const FourChildScreen({
    required this.controller,
    required this.onPressButton,
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
            title: 'Доступна заявкв на доставку',
            alignText: TextAlign.center,
            textSize: 18,
            textColor: firstColor,
            textFont: FontWeight.w600,
          ),
          TextFieldWidget(
            leftPad: 20.0,
            rightPad: 20.0,
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bordRad: 5,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltControler: TextEditingController(),
            textKeyBoard: TextInputType.text,
            onchangText: (String ) {},
            inputBorderText: InputBorder.none,
            labelText: 'Адрес отправки',
            hintText: '',
          ),
          TextFieldWidget(
            leftPad: 20.0,
            rightPad: 20.0,
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bordRad: 5,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltControler: TextEditingController(),
            textKeyBoard: TextInputType.text,
            onchangText: (String ) {},
            inputBorderText: InputBorder.none,
            labelText: 'Адрес доставки',
            hintText: '',
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 24.0, right: 20.0,),
            child: Row(
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
                  textSize: 18.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w600,
                ),
                TextWidget(
                  alignement: Alignment.topRight,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: '5 км',
                  alignText: TextAlign.right,
                  textSize: 18.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 18.0, right: 20.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Стоимость',
                  alignText: TextAlign.left,
                  textSize: 18.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w600,
                ),
                TextWidget(
                  alignement: Alignment.topRight,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: '500 тенге',
                  alignText: TextAlign.right,
                  textSize: 18.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w600,
                ),
              ],
            ),
          ),
          ButtonScreen(
            title: 'Принять заказ',
            leftMarg: 20.0,
            topMarg: 44.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            heightWid: 65.0,
            colorWidget: firstColor,
            onPressed: onPressButton,
            textSize: 16.0,
            isActive: true,
          ),
        ],
      ),
    );
  }
}