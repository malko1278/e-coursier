
import 'package:flutter/material.dart';
import 'package:social_navig/ui/pages/profil/profil_screen.dart';
import 'package:social_navig/ui/widgets/context_menu_widget.dart';

import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/tag_widget.dart';
import 'package:social_navig/ui/widgets/text_widget.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/pages/navig/navigation_screen.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/pages/compagnon/become_compagnon.dart';
import 'package:social_navig/ui/pages/sign_up/registration_screen.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';
import 'package:social_navig/ui/pages/navig/delivery_to_city_screen.dart';
import 'package:social_navig/ui/pages/crowd_shipping/crowd_shipping.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Home> {
  late bool _isCourier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isCourier = true;
  }

  _signUp() {
    if(_isCourier) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilScreen(),
        ),
      );
    }
  }

  _stayCompagn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BecomeCompagnon(),
      ),
    );
  }

  _starOganiser() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CrowdShipping(),
      ),
    );
  }

  _startNavigation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationScreen(),
      ),
    );
  }

  _sendToCity() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryToCityScreen(),
      ),
    );
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
                  margin: EdgeInsets.only(top: 125.0,),
                ),
                TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'В Казахстане',
                  alignText: TextAlign.center,
                  textSize: 18, //17
                  textColor: Colors.black,
                  textFont: FontWeight.w400, // 300
                ),
                TagWidget(
                  heightPosFirst: 180.0,
                  widthPosFirst: 180.0,
                  heightPosSec: 160.0,
                  widthPosSec: 160.0,
                  radiusFirst: 100.0,
                  radiusSecd: 90.0,
                  posTopThird: 105.0,
                  posLeftThird: ((MediaQuery.of(context).size.width/2) - 47.5),// 155.0,
                  widthFIT: 95.0,
                  heightFIT: 95.0,
                  friendImgTag: 'assets/images/friends_app_one.png',
                  titleTag: 'НАДЕЖНЫЙ СЕРВИС\nДОСТАВКИ',
                  titleSize: 24.0,
                ),
                TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 0.0,
                  topMarg: 17.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Хотите заработать на доставке?',
                  alignText: TextAlign.center,
                  textSize: 18,   // 21,
                  textColor: Colors.black,
                  textFont: FontWeight.w600,
                ),
                ButtonScreen(
                  title: 'Стать попутчиком',
                  leftMarg: 64.0,
                  topMarg: 10.0,
                  rightMarg: 64.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: _stayCompagn,
                  textSize: 16.0,
                  isActive: true,
                ),
                TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 0.0,
                  topMarg: 39.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Отправить посылку через\nпопутчиков',
                  alignText: TextAlign.center,
                  textSize: 18,   // 21,
                  textColor: Colors.black,
                  textFont: FontWeight.w600,
                ),
                ButtonScreen(
                  title: 'Кроудшиппинг',
                  leftMarg: 64.0,
                  topMarg: 13.0,
                  rightMarg: 64.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: _starOganiser,
                  textSize: 16.0,
                  isActive: true,
                ),
                TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 0.0,
                  topMarg: 59.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Доставка от двери до двери',
                  alignText: TextAlign.center,
                  textSize: 18,   // 21,
                  textColor: Colors.black,
                  textFont: FontWeight.w600,
                ),
                ButtonScreen(
                  title: 'Доставка по городу',
                  leftMarg: 64.0,
                  topMarg: 15.0,
                  rightMarg: 64.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: _startNavigation,
                  textSize: 16.0,
                  isActive: true,
                ),
                ButtonScreen(
                  title: 'Междугородняя доставка',
                  leftMarg: 64.0,
                  topMarg: 25.0,
                  rightMarg: 64.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: _sendToCity,
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
          Positioned(
            top: 40.0,
            left: 10.0,
            child: Visibility(
              visible: false, // true
              child: ContextMenuWidget(),
            ),
          ),
        ],
      ),
    );
  }
}