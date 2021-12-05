
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';

import '../../button/button_screen.dart';
import '../../text_widget.dart';

class SlideThreeFour extends StatefulWidget {
  final Function () onBack;
  final Function () onPressed;

  const SlideThreeFour({
    required this.onBack,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    onBack,
    onPressed,
  );
}

class InitState extends State<SlideThreeFour> {
  late Function () _onBack;
  late Function () _onPressed;

  InitState(
    this._onBack, this._onPressed,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onBack = widget.onBack;
    _onPressed = widget.onPressed;
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 113.0,),
          ),
          TextWidget(
            alignement: Alignment.topRight,
            leftMarg: 0.0,
            topMarg: 0.0,
            rightMarg: 8.0,
            bottomMarg: 0.0,
            title: 'Шаг 3 из 4',
            alignText: TextAlign.right,
            textSize: 18,
            textColor: Colors.black87,
            textFont: FontWeight.w400,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, top: 12.0, right: 5.0,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: _onBack,
                  icon: Icon(
                    Icons.arrow_back,
                    color: firstColor,
                    size: 25,
                  ),
                ),
                TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Оплата доставки',
                  alignText: TextAlign.center,
                  textSize: 24,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
                SizedBox(width: 49.0,),
              ],
            ),
          ),
          TextWidget(
            alignement: Alignment.center,
            leftMarg: 0.0,
            topMarg: 82.0,
            rightMarg: 0.0,
            bottomMarg: 0.0,
            title: 'Стоимость услуги:',
            alignText: TextAlign.center,
            textSize: 20,
            textColor: Colors.black87,
            textFont: FontWeight.w600,
          ),
          TextWidget(
            alignement: Alignment.center,
            leftMarg: 0.0,
            topMarg: 5.0,
            rightMarg: 0.0,
            bottomMarg: 0.0,
            title: 'Документ - 700 тенге',
            alignText: TextAlign.center,
            textSize: 20,
            textColor: Colors.black87,
            textFont: FontWeight.w400,
          ),
          ButtonScreen(
            title: 'Оплатить',
            leftMarg: 20.0,
            topMarg: 320.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            heightWid: 65.0,
            colorWidget: firstColor,
            onPressed: _onPressed,
            textSize: 16.0,
            isActive: true,
          ),
        ],
      ),
    );
  }
}