
import 'package:flutter/material.dart';
import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/text_widget.dart';
import 'package:social_navig/models/slide/type_object.dart';
import 'package:social_navig/models/slide/shipping_rate.dart';
import 'package:social_navig/ui/widgets/text_field_widget.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/drop_down/drop_down_button_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';

import 'order_delivery_screen.dart';

class DeliveryToCityScreen extends StatefulWidget {
  const DeliveryToCityScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<DeliveryToCityScreen> {
  late bool _checkbox;
  late List<String> _dropValue;
  late List<List<String>> _listValueDropDown;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkbox = false;
    _listValueDropDown = List.filled(2, <String>[]);
    _dropValue = <String>[];
    for (int i = 0; i < _listValueDropDown.length; i++) {
      if(i == 0) {
        _listValueDropDown[0] = List.filled(listTypeObject.length, '');
        for (int j = 0; j < listTypeObject.length; j++) {
          (_listValueDropDown[0])[j] = listTypeObject[j].title;
        }
        _dropValue.add(_listValueDropDown.elementAt(0).elementAt(0));
      } else {
        _listValueDropDown[1] = List.filled(listShippingRate.length, '');
        for (int j = 0; j < listShippingRate.length; j++) {
          (_listValueDropDown[1])[j] = listShippingRate[j].title;
        }
      }
      _dropValue.add(_listValueDropDown.elementAt(i).elementAt(0));
    }
  }

  _signUp() {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
      ),
    );*/
  }

  _selectDropValue(int index, String newValue) {
    setState(() {
      _dropValue[index] = newValue;
    });
  }

  _toCommand() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDeliveryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: thirdColor,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 118.0,),
                ),
                TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 0.0,
                  topMarg: 0.0,
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
                  labelText: 'Город, Адрес отправки',
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
                  labelText: 'Город, Адрес доставки',
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
                  eltValue: _dropValue[0],
                  itemsDropBtn: _listValueDropDown[0],
                  leftPadDrop: 0.0,
                  textSize: 14.0,
                  indexDrop: 0,
                  changeValue: _selectDropValue,
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
                  eltValue: _dropValue[1],
                  itemsDropBtn: [], // _listValueDropDown[1],
                  leftPadDrop: 0.0,
                  textSize: 14.0,
                  indexDrop: 1,
                  changeValue: _selectDropValue,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 20.0,
                  topMarg: 6.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Заявки по тарифу «Сегодня до 23:59»',
                  alignText: TextAlign.left,
                  textSize: 14.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w400,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 20.0,
                  topMarg: 6.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'принимаются до 12:00',
                  alignText: TextAlign.left,
                  textSize: 14.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextWidget(
                      alignement: Alignment.topLeft,
                      leftMarg: 30.0,
                      topMarg: 42.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Цену:',
                      alignText: TextAlign.left,
                      textSize: 18.0,
                      textColor: firstColor,
                      textFont: FontWeight.w500,
                    ),
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 42.0,
                      rightMarg: 35.0,
                      bottomMarg: 0.0,
                      title: '3500 тенге',
                      alignText: TextAlign.right,
                      textSize: 18.0,
                      textColor: Colors.black,
                      textFont: FontWeight.w400,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 34.0,),
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
                          onChanged: (value) => setState(() {
                            _checkbox = !_checkbox;
                            // _onChecked(_checkbox);
                          }),
                        ),
                      ),
                      TextWidget(
                        alignement: Alignment.topLeft,
                        leftMarg: 5.0,
                        topMarg: 0.0,
                        rightMarg: 0.0,
                        bottomMarg: 0.0,
                        title: 'Вы принимаете Правила работы сервиса и\n'
                               'прочитали список запрещенных к пересылке\n'
                               'вещей',
                        alignText: TextAlign.left,
                        textSize: 14.0,
                        textColor: Colors.black,
                        textFont: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                ButtonScreen(
                  title: 'Заказать',
                  leftMarg: 20.0,
                  topMarg: 17.0,
                  rightMarg: 20.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: _toCommand,    // _toCommand,
                  textSize: 16.0,
                  isActive: true,
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
          HeadBar(
            leftMarg: 10.0,
            topMarg: 40.0,
            rightMarg: 10.0,
            bottomMarg: 0.0,
            menu: MenuWidget(
              profilImg: 'assets/images/img_menu.png',
              heightDim: 20.0,
              widthDim: 30.0,
            ),
            logo: LogoWidget(
              logoImg: 'assets/images/simple_logo.png',
              colorFond: secondColor,
              heightDim: 50.0,
              widthDim: 50.0,
              topMarg: 5.0,
              bottomMarg: 5.0,
            ),
            profil: ProfilWidget(
              onPressed: _signUp,
              profilImg: 'assets/images/profil_img.png',
              heightDim: 30.0,
              widthDim: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}