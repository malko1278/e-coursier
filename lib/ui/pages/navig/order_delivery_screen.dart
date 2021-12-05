
import 'package:flutter/material.dart';

import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/text_widget.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';

class OrderDeliveryScreen extends StatefulWidget {
  const OrderDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<OrderDeliveryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  title: 'Заказать доставку',
                  alignText: TextAlign.center,
                  textSize: 24.0,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
                Container(
                  margin: EdgeInsets.only(left: 27.0, top: 37.0, right: 20.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 13.0,
                            height: 111.5,
                          ),
                          Positioned(
                            left: 0.0,
                            top: 1.5,
                            child: Icon(
                              Icons.circle,
                              color: firstColor,
                              size: 12.5,
                            ),
                          ),
                          Positioned(
                            left: 5.5,
                            top: 11.0,
                            child: Container(
                              width: 2.0,
                              height: 89.5,
                              color: firstColor,
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            top: 98.0,
                            child: Icon(
                              Icons.circle,
                              color: firstColor,
                              size: 12.5,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextWidget(
                                alignement: Alignment.topLeft,
                                leftMarg: 7.0,
                                topMarg: 0.0,
                                rightMarg: 0.0,
                                bottomMarg: .0,
                                title: 'Откуда',
                                alignText: TextAlign.left,
                                textSize: 14,
                                textColor: Colors.grey.shade500,
                                textFont: FontWeight.w500,
                              ),
                              TextWidget(
                                alignement: Alignment.topLeft,
                                leftMarg: 7.0,
                                topMarg: 0.0,
                                rightMarg: 0.0,
                                bottomMarg: .0,
                                title: 'Алматы',
                                alignText: TextAlign.left,
                                textSize: 14,
                                textColor: Colors.black,
                                textFont: FontWeight.w700,
                              ),
                              TextWidget(
                                alignement: Alignment.topLeft,
                                leftMarg: 7.0,
                                topMarg: 0.0,
                                rightMarg: 0.0,
                                bottomMarg: .0,
                                title: 'ул. Константинопольская 25',
                                alignText: TextAlign.left,
                                textSize: 14,
                                textColor: Colors.grey.shade800,
                                textFont: FontWeight.w500,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextWidget(
                                alignement: Alignment.topLeft,
                                leftMarg: 7.0,
                                topMarg: 42.0,
                                rightMarg: 0.0,
                                bottomMarg: .0,
                                title: 'Куда',
                                alignText: TextAlign.left,
                                textSize: 14,
                                textColor: Colors.grey.shade500,
                                textFont: FontWeight.w500,
                              ),
                              TextWidget(
                                alignement: Alignment.topLeft,
                                leftMarg: 7.0,
                                topMarg: 0.0,
                                rightMarg: 0.0,
                                bottomMarg: .0,
                                title: 'Нурсултан',
                                alignText: TextAlign.left,
                                textSize: 14,
                                textColor: Colors.black,
                                textFont: FontWeight.w500,
                              ),
                              TextWidget(
                                alignement: Alignment.topLeft,
                                leftMarg: 7.0,
                                topMarg: 0.0,
                                rightMarg: 0.0,
                                bottomMarg: .0,
                                title: 'ул. Большая Константинопольская 25',
                                alignText: TextAlign.left,
                                textSize: 14,
                                textColor: Colors.grey.shade800,
                                textFont: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 39.0, top: 30.0, right: 26.0,),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextWidget(
                            alignement: Alignment.topLeft,
                            leftMarg: 0.0,
                            topMarg: 0.0,
                            rightMarg: 0.0,
                            bottomMarg: 0.0,
                            title: 'Тариф:',
                            alignText: TextAlign.left,
                            textSize: 16.0,
                            textColor: firstColor,
                            textFont: FontWeight.w500,
                          ),
                          TextWidget(
                            alignement: Alignment.topRight,
                            leftMarg: 0.0,
                            topMarg: 0.0,
                            rightMarg: 0.0,
                            bottomMarg: 0.0,
                            title: 'Сегодня до 23:59',
                            alignText: TextAlign.right,
                            textSize: 16.0,
                            textColor: Colors.grey.shade600,
                            textFont: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextWidget(
                            alignement: Alignment.topLeft,
                            leftMarg: 0.0,
                            topMarg: 7.0,
                            rightMarg: 0.0,
                            bottomMarg: 0.0,
                            title: 'Что везти:',
                            alignText: TextAlign.left,
                            textSize: 16.0,
                            textColor: firstColor,
                            textFont: FontWeight.w500,
                          ),
                          TextWidget(
                            alignement: Alignment.topRight,
                            leftMarg: 0.0,
                            topMarg: 7.0,
                            rightMarg: 0.0,
                            bottomMarg: 0.0,
                            title: '33*25*15 см до 5 кг',
                            alignText: TextAlign.right,
                            textSize: 16.0,
                            textColor: Colors.grey.shade600,
                            textFont: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextWidget(
                            alignement: Alignment.topLeft,
                            leftMarg: 0.0,
                            topMarg: 7.0,
                            rightMarg: 0.0,
                            bottomMarg: 0.0,
                            title: 'Цена:',
                            alignText: TextAlign.left,
                            textSize: 16.0,
                            textColor: firstColor,
                            textFont: FontWeight.w500,
                          ),
                          TextWidget(
                            alignement: Alignment.topRight,
                            leftMarg: 0.0,
                            topMarg: 7.0,
                            rightMarg: 0.0,
                            bottomMarg: 0.0,
                            title: '3500 тенге',
                            alignText: TextAlign.right,
                            textSize: 16.0,
                            textColor: Colors.grey.shade600,
                            textFont: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ButtonScreen(
                  title: 'Оплатить',
                  leftMarg: 20.0,
                  topMarg: 201.0,
                  rightMarg: 20.0,
                  bottomMarg: 0.0,
                  leftPad: 0.0,
                  topPad: 20.0,
                  rightPad: 0.0,
                  bottomPad: 20.0,
                  heightWid: 65.0,
                  colorWidget: firstColor,
                  onPressed: () {},    // _toCommand,
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