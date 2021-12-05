
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/button/flat_button_screen.dart';

import '../../text_widget.dart';

class ValidDeliverySlideScreen extends StatefulWidget {
  const ValidDeliverySlideScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ValidDeliverySlideScreen> {

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
            title: 'Поиск курьера',
            alignText: TextAlign.center,
            textSize: 24.0,
            textColor: firstColor,
            textFont: FontWeight.w600,
          ),
          TextWidget(
            alignement: Alignment.center,
            leftMarg: 0.0,
            topMarg: 58.0,
            rightMarg: 0.0,
            bottomMarg: 0.0,
            title: 'Если ползоиатель нажимает кнопку\n'
                   '«Отменить заказ» до приема заказа\n'
                   'курьером, то сумма с карты не\n'
                   'списывается.\n'
                   'Если после приема заказа курьером-\n'
                   'списывается вся сумма доставки.',
            alignText: TextAlign.center,
            textSize: 16,
            textColor: Colors.black87,
            textFont: FontWeight.w300,
          ),
          FlatButtonScreen(
            title: 'Отменить заказ',
            leftMarg: 20.0,
            topMarg: 280.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            colorWidget: firstColor,
            onPressed: () {},       // _toCommand,
            textSize: 16.0,
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}