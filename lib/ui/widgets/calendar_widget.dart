
import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final int nbrDay;
  final Axis sensScroll;
  const CalendarWidget ({required this.nbrDay, required this.sensScroll, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 240.0,
      margin: EdgeInsets.only(top: 24.0,),
      child: SingleChildScrollView(
        scrollDirection: sensScroll,
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Column(
            children: List.generate(nbrDay, (index) {
              return Container();
              /*
              return LineDateWidget(
                index: index,
                leftMarg: 10.0,
                topMarg: 0.0,
                rightMarg: 10.0,
                bottomMarg: 0.0,
                borderColor: Colors.white,  // firstColor, // Colors.white,
                elevetBtn: 6.0,
              );
              */
            }),
          ),
        ),
      ),
    );
  }
}