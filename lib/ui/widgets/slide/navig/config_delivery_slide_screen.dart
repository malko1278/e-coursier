
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';

import '../../text_widget.dart';
import '../../toogle_wiget.dart';
import '../../text_field_widget.dart';
import '../../drop_down/drop_down_button_widget.dart';

class ConfigDeliverySlideScreen extends StatefulWidget {
  final Function() toCommand;
  const ConfigDeliverySlideScreen({
    required this.toCommand,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    toCommand,
  );
}

class InitState extends State<ConfigDeliverySlideScreen> {
  late Function() _toCommand;

  // Locales variables
  late bool _tooglState;
  late String _dropValue;
  late List<String> listValueDropDown;

  InitState(this._toCommand);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tooglState = false;
    _dropValue = '';
    listValueDropDown = <String>[];
    for (int i = 0; i <= 6; i++) {
      listValueDropDown.add('Вид передвижения_$i');
    }
    _dropValue = listValueDropDown.elementAt(0);
  }

  @override
  dispose() {
    // TODO: implement initState
    super.dispose();
  }

  _tooglChange(bool value) {
    setState(() {
      _tooglState = value;
    });
  }

  _selectDropValue(int index, String newValue) {
    setState(() {
      _dropValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextWidget(
            alignement: Alignment.center,
            leftMarg: 0.0,
            topMarg: 118.0,
            rightMarg: 0.0,
            bottomMarg: 0.0,
            title: 'Оформить доставку',
            alignText: TextAlign.center,
            textSize: 24.0,
            textColor: firstColor,
            textFont: FontWeight.w600,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 23.0, right: 20.0, bottom: 0.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ToogleWidget(
                  tooglState: _tooglState,
                  tooglChang: _tooglChange,
                ),
                SizedBox(width: 5.0,),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Другой отправитель',
                  alignText: TextAlign.start,
                  textSize: 15.0,
                  textColor: Colors.grey.shade600,
                  textFont: FontWeight.w400,
                ),
              ],
            ),
          ),
          TextFieldWidget(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bordRad: 5,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltControler: TextEditingController(),
            textKeyBoard: TextInputType.phone,
            onchangText: (String ) {},
            inputBorderText: InputBorder.none,
            labelText: 'Номер отправителя',
            hintText: '+7 (xxx) xxx xx xx',
          ),
          TextFieldWidget(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bordRad: 5,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltControler: TextEditingController(),
            textKeyBoard: TextInputType.phone,
            onchangText: (String ) {},
            inputBorderText: InputBorder.none,
            labelText: 'Номер получателя',
            hintText: '+7 (xxx) xxx xx xx',
          ),
          TextFieldWidget(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bordRad: 5,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltControler: TextEditingController(),
            textKeyBoard: TextInputType.number,
            onchangText: (String ) {},
            inputBorderText: InputBorder.none,
            labelText: 'Номер квартиры, офиса',
            hintText: '',
          ),
          DropDownButtonWidget(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            heigWidget: 60.0,
            rigWidget: _size.width,
            bordRad: 5.0,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltValue: _dropValue,
            itemsDropBtn: listValueDropDown,
            leftPadDrop: 0.0,
            textSize: 14.0,
            indexDrop: 6,
            changeValue: _selectDropValue,
          ),
          ButtonScreen(
            title: 'Начать поиск курьера',
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
            onPressed: _toCommand,
            textSize: 16.0,
            isActive: true,
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}