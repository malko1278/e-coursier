
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/text_button_widget.dart';

class ContextMenuWidget extends StatelessWidget {
  // final Function (int) menuAction;
  // const ContextMenuWidget({required this.menuAction, Key? key}) : super(key: key);
  const ContextMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 300.0,
      height: 480.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 0.0,
        top: 0.0,
        right: 0.0,
        bottom: 37.0,
      ),
      child: Container(
        // color: Colors.yellow,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {}, // menuAction,
                    // hoverColor: firstColor,
                    icon: Icon(
                      Icons.close,
                      color: firstColor,
                      size: 20.0,
                    ),
                  ),
                ),
                TextButtonWidget(
                  widthCont: 300.0,
                  leftPad: 10.0,
                  topPad: 3.0,
                  bottomPad: 3.0,
                  title: 'Доставка с попутчиками',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w400,
                  indice: 1,
                    actionMenu: () {} // menuAction,
                ),
                TextButtonWidget(
                  widthCont: 300.0,
                  leftPad: 10.0,
                  topPad: 3.0,
                  bottomPad: 3.0,
                  title: 'Доставка курьерами по городу',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w400,
                  indice: 2,
                    actionMenu: () {} // menuAction,
                ),
                TextButtonWidget(
                  widthCont: 300.0,
                  leftPad: 10.0,
                  topPad: 3.0,
                  bottomPad: 3.0,
                  title: 'Доставка курьерами межгород',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w400,
                  indice: 3,
                    actionMenu: () {} // menuAction,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButtonWidget(
                  widthCont: 300.0,
                  leftPad: 10.0,
                  topPad: 3.0,
                  bottomPad: 3.0,
                  title: 'Правила рвботы сервиса',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w400,
                  indice: 4,
                    actionMenu: () {} // menuAction,
                ),
                TextButtonWidget(
                  widthCont: 300.0,
                  leftPad: 10.0,
                  topPad: 3.0,
                  bottomPad: 3.0,
                  title: 'Служба поддержки',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w400,
                  indice: 4,
                    actionMenu: () {} // menuAction,
                ),
                TextButtonWidget(
                  widthCont: 300.0,
                  leftPad: 10.0,
                  topPad: 3.0,
                  bottomPad: 3.0,
                  title: 'О сервисе',
                  alignText: TextAlign.left,
                  textSize: 16.0,
                  textColor: firstColor,
                  textFont: FontWeight.w400,
                  indice: 6,
                    actionMenu: () {} // menuAction,
                ),

              ],
            ),
            TextButtonWidget(
              widthCont: 300.0,
              leftPad: 10.0,
              topPad: 3.0,
              bottomPad: 3.0,
              title: 'Стать курьером',
              alignText: TextAlign.left,
              textSize: 16.0,
              textColor: firstColor,
              textFont: FontWeight.w400,
              indice: 7,
              actionMenu: () {} // menuAction,
            ),
          ],
        ),
      ),
    );
  }
}