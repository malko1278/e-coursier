
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/models/data/travel.dart';
import 'package:social_navig/ui/widgets/line_date/line_date_widget.dart';
import 'package:social_navig/util/utils.dart';

import '../text_widget.dart';

class CarteMachineWidget extends StatelessWidget {
  final int indexVal;
  final Travel travel;
  /*
  final double leftMarg;
  final double topMarg;
  final double rightMarg;
  final double bottomMarg;
  final double elevetBtn;
  final Color borderColor;
  */

  const CarteMachineWidget({
    required this.indexVal,
    required this.travel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: 320.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade600,
          width: 1.0,
        ),
      ),
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60.0,
                // color: Colors.red,
                child: TextWidget(
                  alignement: Alignment.center,
                  leftMarg: 15.0,
                  topMarg: 14.0,
                  rightMarg: 5.0,
                  bottomMarg: 0.0,
                  title: '${separateDate(travel.travel_date)[0]}',
                  alignText: TextAlign.left,
                  textSize: 30.0,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
              ),
              Container(
                width: (_size.width-(100)),
                margin: EdgeInsets.only(left: 0.0, right: 15.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextWidget(
                          alignement: Alignment.topLeft,
                          leftMarg: 0.0,
                          topMarg: 12.0,
                          rightMarg: 0.0,
                          bottomMarg: 0.0,
                          title: getRussianMonth(separateDate(travel.travel_date)[1]),
                          alignText: TextAlign.left,
                          textSize: 14.0,
                          textColor: Colors.black87,
                          textFont: FontWeight.w500,
                        ),
                        TextWidget(
                          alignement: Alignment.topRight,
                          leftMarg: 0.0,
                          topMarg: 0.0,
                          rightMarg: 0.0,
                          bottomMarg: 0.0,
                          title: getRussianDay(DateFormat('d:M:yyyy').parse(travel.travel_date).weekday),
                          alignText: TextAlign.right,
                          textSize: 12.0,
                          textColor: Colors.black54,
                          textFont: FontWeight.w500,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextWidget(
                            alignement: Alignment.topRight,
                            leftMarg: 0.0,
                            topMarg: 0.0,
                            rightMarg: 5.0,
                            bottomMarg: 0.0,
                            title: 'Свободен',
                            alignText: TextAlign.right,
                            textSize: 12.0,
                            textColor: Colors.black54,
                            textFont: FontWeight.w500,
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Константинопольский',
                  alignText: TextAlign.left,
                  textSize: 18.0,
                  textColor: Colors.black54,
                  textFont: FontWeight.w700,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 3.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Константин Константинович',
                  alignText: TextAlign.left,
                  textSize: 18.0,
                  textColor: Colors.black54,
                  textFont: FontWeight.w700,
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 15.0, top: 9.0, right: 15.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Когда едет:',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w500,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 3.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: '${separateDate(travel.travel_date)[0]}.${separateDate(travel.travel_date)[1]}  ${travel.travel_hour}',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: Colors.black54,
                  textFont: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Транспорт',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w500,
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 3.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: travel.transport,
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: Colors.black54,
                  textFont: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 15.0, top: 16.0, right: 15.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Готов доставить:',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w500,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Документ', // travel.type_packet,
                      alignText: TextAlign.right,
                      textSize: 16.0,
                      textColor: Colors.black54,
                      textFont: FontWeight.w400,
                    ),
                    TextWidget(
                      alignement: Alignment.topRight,
                      leftMarg: 0.0,
                      topMarg: 0.0,
                      rightMarg: 0.0,
                      bottomMarg: 0.0,
                      title: 'Посылка до 5 кг', // travel.type_packet,
                      alignText: TextAlign.right,
                      textSize: 16.0,
                      textColor: Colors.black54,
                      textFont: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 15.0, top: 18.75, right: 5.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 0.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Можно связаться',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w500,
                ),
                Container(
                  width: 160.0,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/img_appel.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          size: 30.0,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/img_telegram.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}