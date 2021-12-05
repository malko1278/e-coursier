
import 'package:flutter/material.dart';

import '../../text_widget.dart';

class AddressWidget extends StatelessWidget {
  final Widget iconAddress;
  final TextWidget firstText;
  final TextWidget secondText;
  final double topMarg;
  const AddressWidget({
    required this.iconAddress,
    required this.firstText,
    required this.secondText,
    required this.topMarg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 11.5, top: topMarg, right: 11.5,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          iconAddress,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              firstText,
              secondText,
            ],
          ),
        ],
      ),
    );
  }
}