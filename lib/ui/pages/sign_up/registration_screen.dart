
import 'package:flutter/material.dart';

import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/text_widget.dart';
import 'package:social_navig/ui/widgets/text_field_widget.dart';
import 'package:social_navig/ui/pages/profil/profil_screen.dart';
import 'package:social_navig/ui/widgets/drop_down/drop_down_button_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<RegistrationScreen> {
  List<String> listValueDropDown = <String>[];
  String _dropValue = '';
  bool _checkbox = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      for (int i = 0; i <= 6; i++) {
        listValueDropDown.add('Вид передвижения_$i');
      }
      _dropValue = listValueDropDown.elementAt(0);
    });
  }

  _signUp() {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
      ),
    );*/
  }

  _connectProfil() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilScreen(),
      ),
    );
  }

  _selectDropValue(int index, String newValue) {
    setState(() {
      _dropValue = newValue;
    });
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
                  margin: EdgeInsets.only(top: 144.0,),
                ),
                TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Регистрация курьером',
                  alignText: TextAlign.center,
                  textSize: 24.0,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 24.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/person_img_profil.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextWidget(
                              alignement: Alignment.topLeft,
                              leftMarg: 0.0,
                              topMarg: 0.0,
                              rightMarg: 0.0,
                              bottomMarg: 0.0,
                              title: 'Фото курьера',
                              alignText: TextAlign.left,
                              textSize: 16,
                              textColor: Colors.black,
                              textFont: FontWeight.w400,
                            ),
                            TextWidget(
                              alignement: Alignment.topLeft,
                              leftMarg: 0.0,
                              topMarg: 0.0,
                              rightMarg: 0.0,
                              bottomMarg: 0.0,
                              title: 'Формат jpg, bmp или pdf, размер до 5Мб',
                              alignText: TextAlign.left,
                              textSize: 14,
                              textColor: Colors.black,
                              textFont: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextFieldWidget(
                  leftPad: 10.0,
                  rightPad: 10.0,
                  leftMarg: 20.0,
                  topMarg: 30.0,
                  rightMarg: 20.0,
                  bordRad: 5,
                  colorElt: Colors.white,
                  borderColorElt: Colors.grey.shade500,
                  borderWidth: 1.0,
                  eltControler: TextEditingController(),
                  textKeyBoard: TextInputType.text,
                  onchangText: (String ) {},
                  inputBorderText: InputBorder.none,
                  labelText: 'Как вас зовут',
                  hintText: '',
                ),
                TextFieldWidget(
                  leftPad: 10.0,
                  rightPad: 10.0,
                  leftMarg: 20.0,
                  topMarg: 30.0,
                  rightMarg: 20.0,
                  bordRad: 5,
                  colorElt: Colors.white,
                  borderColorElt: Colors.grey.shade500,
                  borderWidth: 1.0,
                  eltControler: TextEditingController(),
                  textKeyBoard: TextInputType.phone,
                  onchangText: (String ) {},
                  inputBorderText: InputBorder.none,
                  labelText: 'Ваш телефон',
                  hintText: '',
                ),
                TextFieldWidget(
                  leftPad: 10.0,
                  rightPad: 10.0,
                  leftMarg: 20.0,
                  topMarg: 30.0,
                  rightMarg: 20.0,
                  bordRad: 5,
                  colorElt: Colors.white,
                  borderColorElt: Colors.grey.shade500,
                  borderWidth: 1.0,
                  eltControler: TextEditingController(),
                  textKeyBoard: TextInputType.streetAddress,
                  onchangText: (String ) {},
                  inputBorderText: InputBorder.none,
                  labelText: 'Ваша почта',
                  hintText: '',
                ),
                TextFieldWidget(
                  leftPad: 10.0,
                  rightPad: 10.0,
                  leftMarg: 20.0,
                  topMarg: 30.0,
                  rightMarg: 20.0,
                  bordRad: 5,
                  colorElt: Colors.white,
                  borderColorElt: Colors.grey.shade500,
                  borderWidth: 1.0,
                  eltControler: TextEditingController(),
                  textKeyBoard: TextInputType.phone,
                  onchangText: (String ) {},
                  inputBorderText: InputBorder.none,
                  labelText: 'Дата рождения',
                  hintText: '',
                ),
                DropDownButtonWidget(
                  leftPad: 0.0,
                  rightPad: 10.0,
                  leftMarg: 20.0,
                  topMarg: 30.0,
                  rightMarg: 20.0,
                  heigWidget: 60.0,
                  rigWidget: _size.width,
                  bordRad: 5.0,
                  colorElt: Colors.white,
                  borderColorElt: Colors.grey.shade500,
                  borderWidth: 1.0,
                  eltValue: _dropValue,
                  itemsDropBtn: listValueDropDown, // listValueDropDown
                  leftPadDrop: 0.0,
                  textSize: 16.0,
                  indexDrop: 0,
                  changeValue: _selectDropValue,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 20.0,
                  topMarg: 44.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Удостоверение личности',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w500,     // 300,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 20.0,
                  topMarg: 11.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Загрузите лицевую и обратную сторону\n'
                         'удостоверения личности, фото водительских прав\n'
                         'и автотранспорта для автокурьеров',
                  alignText: TextAlign.left,
                  textSize: 14.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w300,
                ),
                ButtonScreen(
                  title: 'Лицевая сторона',
                  leftMarg: 20.0,
                  topMarg: 13.0,
                  rightMarg: 20.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: () {},
                  textSize: 16.0,
                  isActive: true,
                ),
                ButtonScreen(
                  title: 'Обратная сторона',
                  leftMarg: 20.0,
                  topMarg: 19.0,
                  rightMarg: 20.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: () {},
                  textSize: 16.0,
                  isActive: true,
                ),
                ButtonScreen(
                  title: 'Фото автотранспорта',
                  leftMarg: 20.0,
                  topMarg: 19.0,
                  rightMarg: 20.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: Colors.grey.shade600,
                  onPressed: () {},
                  textSize: 16.0,
                  isActive: true,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 20.0,
                  topMarg: 9.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Формат jpg, bmp или pdf, размер до 5 Мб',
                  alignText: TextAlign.left,
                  textSize: 14.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w300,
                ),
                ButtonScreen(
                  title: 'Фото водительских прав',
                  leftMarg: 20.0,
                  topMarg: 19.0,
                  rightMarg: 20.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: Colors.grey.shade600,
                  onPressed: () {},
                  textSize: 16.0,
                  isActive: true,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 20.0,
                  topMarg: 9.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Формат jpg, bmp или pdf, размер до 5 Мб',
                  alignText: TextAlign.left,
                  textSize: 14.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w300,
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.0, top: 51.0,),
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
                          }),
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
                ButtonScreen(
                  title: 'Зарегистрироватся',
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
                  onPressed: _connectProfil,
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