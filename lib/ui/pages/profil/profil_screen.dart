
import 'package:flutter/material.dart';

import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/text_widget.dart';
import 'package:social_navig/ui/widgets/text_field_widget.dart';
import 'package:social_navig/ui/widgets/command/command_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ProfilScreen> {

  _signUp() {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {

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
                  title: 'Профиль курьера',
                  alignText: TextAlign.center,
                  textSize: 24.0,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
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
                  textKeyBoard: TextInputType.emailAddress,
                  onchangText: (String ) {},
                  inputBorderText: InputBorder.none,
                  labelText: 'Ваша почта',
                  hintText: '',
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 20.0,
                  topMarg: 53.0,
                  rightMarg: 0.0,
                  bottomMarg: 20.0,
                  title: 'История заказов',
                  alignText: TextAlign.left,
                  textSize: 18.0,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
                Column(
                  children: List.generate(10, (index) {
                    return CommandWidget();
                  }),
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