
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/draggable/address/addresss_widget.dart';

import '../../text_field_Icon_widget.dart';
import '../../text_widget.dart';

class FirstChildScreen extends StatelessWidget {
  final ScrollController controller;
  final Function () activeEditText;
  final Function (int) selectAction;
  final Function () onPressButton;

  const FirstChildScreen({
    required this.controller,
    required this.activeEditText,
    required this.selectAction,
    required this.onPressButton,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    IconButton _getImageButton(int pos) {
      return IconButton(
        onPressed: () {
          selectAction(pos);
        },
        icon: Image(
          image: AssetImage('assets/images/bxs_map_pin.png'),
        ),
      );
    }

    TextWidget _firstTest = TextWidget(
      alignement: Alignment.topRight,
      leftMarg: 0.0,
      topMarg: 3.0,
      rightMarg: 0.0,
      bottomMarg: 0.0,
      title: 'Вы находитесь',
      alignText: TextAlign.right,
      textSize: 13,
      textColor: Colors.black38,
      textFont: FontWeight.w400,
    );

    TextWidget _secondTest = TextWidget(
      alignement: Alignment.topRight,
      leftMarg: 0.0,
      topMarg: 0.0,
      rightMarg: 0.0,
      bottomMarg: 0.0,
      title: 'проспекть Абылай Хан 15',
      alignText: TextAlign.right,
      textSize: 18,
      textColor: Colors.black87,
      textFont: FontWeight.w400,
    );

    TextWidget _thirdTest = TextWidget(
      alignement: Alignment.topRight,
      leftMarg: 0.0,
      topMarg: 0.0,
      rightMarg: 0.0,
      bottomMarg: 0.0,
      title: 'ранее использовался',
      alignText: TextAlign.right,
      textSize: 13,
      textColor: Colors.black38,
      textFont: FontWeight.w400,
    );

    return Expanded(
      child: ListView(
        controller: controller,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              selectAction(1);
            },
            child: AddressWidget(
              iconAddress: _getImageButton(1),
              firstText: _firstTest,
              secondText: _secondTest,
              topMarg: 0.0,
            ),
          ),
          TextFielIcondWidget(
            leftPad: 0.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 28.0,
            rightMarg: 20.0,
            bordRad: 5,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltControler: TextEditingController(),
            textKeyBoard: TextInputType.streetAddress,
            inputBorderText: InputBorder.none,
            labelText: 'Поиск города, района, улицы,',
            hintText: '',
            activeEditText: () {
              activeEditText;  // Ne fonctionne pas bien. Revoir cette action
            },
          ),
          GestureDetector(
            onTap: () {
              selectAction(3);
            },
            child: AddressWidget(
              iconAddress: _getImageButton(3),
              firstText: _thirdTest,
              secondText: _secondTest,
              topMarg: 49.0,
            ),
          ),
          ButtonScreen(
            title: 'Куда нужно доставить посылку',
            leftMarg: 20.0,
            topMarg: 37.0,
            rightMarg: 20.0,
            bottomMarg: 20.0,
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