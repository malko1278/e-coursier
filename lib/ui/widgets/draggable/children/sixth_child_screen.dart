
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';

import '../../text_widget.dart';

class SixthChildScreen extends StatelessWidget {
  final ScrollController controller;
  final Function () onPressBt1;
  final Function () onPressBtn2;
  final Function () onPressBtn3;

  const SixthChildScreen({
    required this.controller,
    required this.onPressBt1,
    required this.onPressBtn2,
    required this.onPressBtn3,
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
          ButtonScreen(
            title: 'Принять заказ',
            leftMarg: 20.0,
            topMarg: 38.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            heightWid: 65.0,
            colorWidget: firstColor,
            onPressed: onPressBt1,
            textSize: 16.0,
            isActive: true,
          ),
          ButtonScreen(
            title: 'Позвонить отправителю',
            leftMarg: 20.0,
            topMarg: 90.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            heightWid: 65.0,
            colorWidget: firstColor,
            onPressed: onPressBt1,
            textSize: 16.0,
            isActive: true,
          ),
          ButtonScreen(
            title: 'Позвонить заказчики',
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            heightWid: 65.0,
            colorWidget: firstColor,
            onPressed: onPressBt1,
            textSize: 16.0,
            isActive: true,
          ),
        ],
      ),
    );
  }
}