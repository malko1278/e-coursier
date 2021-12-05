
import 'package:flutter/material.dart';

import '../text_widget.dart';

class CommandWidget extends StatelessWidget {
  const CommandWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: 90.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade600,
          width: 1.0,
        ),
      ),
      margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                alignement: Alignment.topRight,
                leftMarg: 20.0,
                topMarg: 10.0,
                rightMarg: 0.0,
                bottomMarg: 0.0,
                title: 'Дата :',
                alignText: TextAlign.right,
                textSize: 14,
                textColor: Colors.black87,
                textFont: FontWeight.w500,
              ),
              TextWidget(
                alignement: Alignment.topRight,
                leftMarg: 20.0,
                topMarg: 2.0,
                rightMarg: 0.0,
                bottomMarg: 0.0,
                title: 'Статус :',
                alignText: TextAlign.right,
                textSize: 14,
                textColor: Colors.black87,
                textFont: FontWeight.w500,
              ),
              TextWidget(
                alignement: Alignment.topRight,
                leftMarg: 20.0,
                topMarg: 2.0,
                rightMarg: 0.0,
                bottomMarg: 13.0,
                title: 'Оплата :',
                alignText: TextAlign.right,
                textSize: 14,
                textColor: Colors.black87,
                textFont: FontWeight.w500,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidget(
                alignement: Alignment.topRight,
                leftMarg: 0.0,
                topMarg: 10.0,
                rightMarg: 20.0,
                bottomMarg: 0.0,
                title: '20.08.21 13:55 - 15:30',
                alignText: TextAlign.right,
                textSize: 14,
                textColor: Colors.black87,
                textFont: FontWeight.w400,
              ),
              TextWidget(
                alignement: Alignment.topRight,
                leftMarg: 0.0,
                topMarg: 2.0,
                rightMarg: 20.0,
                bottomMarg: 0.0,
                title: 'Закрыт',
                alignText: TextAlign.right,
                textSize: 14,
                textColor: Colors.black87,
                textFont: FontWeight.w400,
              ),
              TextWidget(
                alignement: Alignment.topRight,
                leftMarg: 0.0,
                topMarg: 2.0,
                rightMarg: 20.0,
                bottomMarg: 13.0,
                title: '500 тенге',
                alignText: TextAlign.right,
                textSize: 14,
                textColor: Colors.black87,
                textFont: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}