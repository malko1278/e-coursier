
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/draggable/address/addresss_widget.dart';

import '../../text_widget.dart';
import '../../text_field_Icon_widget.dart';

class SecondChildScreen extends StatelessWidget {
  final ScrollController controller;
  final Function (int) selectAction;
  final Function () onPressButton;

  const SecondChildScreen({
    required this.controller,
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

    TextWidget _firstTest = TextWidget(
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
          TextWidget(
            alignement: Alignment.center,
            leftMarg: 20.0,
            topMarg: 0.0,
            rightMarg: 20.0,
            bottomMarg: .0,
            title: 'Куда нужно доставить посылку?',
            alignText: TextAlign.center,
            textSize: 20,
            textColor: firstColor,
            textFont: FontWeight.w600,
          ),
          TextFielIcondWidget(
            leftPad: 0.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 35.0,
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
              // activeEditText;
            }, // (2)
          ),
          GestureDetector(
            onTap: () {
              selectAction(9);
            },
            child: AddressWidget(
              iconAddress: _getImageButton(9), // _getImageButton(2)
              firstText: _firstTest,
              secondText: _secondTest,
              topMarg: 49.0,
            ),
          ),
          ButtonScreen(
            title: 'Куда нужно доставить посылку?',
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