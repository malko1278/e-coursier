

import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/button/flat_button_screen.dart';

import '../../text_field_widget.dart';
import '../../text_widget.dart';

class OrganisedDeliverySlideScreen extends StatefulWidget {
  final bool checked;
  final Function(bool value) onChecked;
  final Function() toCommand;

  const OrganisedDeliverySlideScreen({
    required this.checked,
    required this.onChecked,
    required this.toCommand,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    checked, onChecked, toCommand,
  );
}

class InitState extends State<OrganisedDeliverySlideScreen> {
  bool _checkbox = false;
  late Function(bool value) _onChecked;
  late Function() _toCommand;
  late List<bool> _buttonValid;

  InitState(this._checkbox, this._onChecked, this._toCommand);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkbox = widget.checked;
    _onChecked = widget.onChecked;
    _toCommand = widget.toCommand;
    _buttonValid = List.filled(2, !_checkbox);
    _buttonValid[1] = _checkbox;
  }

  _regleAccepted() {
    setState(() {
      _checkbox = !_checkbox;
      _onChecked(_checkbox);
      _buttonValid[0] = !_checkbox;
      _buttonValid[1] = _checkbox;

    });
  }

  @override
  Widget build(BuildContext context) {

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
          TextFieldWidget(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 33.0,
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
            textKeyBoard: TextInputType.text,
            onchangText: (String ) {},
            inputBorderText: InputBorder.none,
            labelText: 'Адрес доставки',
            hintText: '',
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 33.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Оформить доставку',
                  alignText: TextAlign.left,
                  textSize: 18.0,
                  textColor: firstColor,
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
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 18.0, right: 20.0),
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
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
                TextWidget(
                  alignement: Alignment.topRight,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: '600 тенге',
                  alignText: TextAlign.right,
                  textSize: 18.0,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
              ],
            ),
          ),
          TextWidget(
            alignement: Alignment.topLeft,
            leftMarg: 20.0,
            topMarg: 2.0,
            rightMarg: 0.0,
            bottomMarg: 0.0,
            title: 'из расчета 120 тенге за 1 км',
            alignText: TextAlign.left,
            textSize: 12.0,
            textColor: Colors.black,
            textFont: FontWeight.w400,
          ),
          TextWidget(
            alignement: Alignment.topLeft,
            leftMarg: 20.0,
            topMarg: 22.0,
            rightMarg: 0.0,
            bottomMarg: 0.0,
            title: 'Минимальная сумма заказа 400 тенге',
            alignText: TextAlign.left,
            textSize: 12.0,
            textColor: Colors.black,
            textFont: FontWeight.w400,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 37.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  margin: EdgeInsets.only(top: 2.0,),
                  child: Checkbox(
                    value: _checkbox,
                    onChanged: (value) => _regleAccepted(),
                  ),
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 5.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Я принимаю правила работы сервиса и\n'
                      'ознакомлен со Списком запрещенных к\n'
                      'отправке посылок',
                  alignText: TextAlign.left,
                  textSize: 14.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w300,
                ),
              ],
            ),
          ),
          Visibility(
            visible: _buttonValid[0],
            child: ButtonScreen(
              title: 'Заказать',
              leftMarg: 20.0,
              topMarg: 25.0,
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
              isActive: false,
            ),
          ),
          Visibility(
            visible: _buttonValid[1],
            child: ButtonScreen(
              title: 'Заказать',
              leftMarg: 20.0,
              topMarg: 25.0,
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
          ),
          FlatButtonScreen(
            title: 'Предложить свою цеку за доствку',
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            colorWidget: firstColor,
            onPressed: () {},      // _choosePrice,
            textSize: 16.0,
          ),
          TextWidget(
            alignement: Alignment.topLeft,
            leftMarg: 28.0,
            topMarg: 20.0,
            rightMarg: 0.0,
            bottomMarg: 0.0,
            title: 'Вы можете предложить за доставку сумму выше\n'
                   'рекомендованной, чтобы стимулиравать\n'
                   'курьера',
            alignText: TextAlign.left,
            textSize: 14.0,
            textColor: Colors.black,
            textFont: FontWeight.w300,
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}