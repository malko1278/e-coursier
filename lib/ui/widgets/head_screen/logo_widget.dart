
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String logoImg;
  final Color colorFond;
  final double widthDim;
  final double heightDim;
  final double topMarg;
  final double bottomMarg;

  const LogoWidget ({
    required this.logoImg,
    required this.colorFond,
    required this.widthDim,
    required this.heightDim,
    required this.topMarg,
    required this.bottomMarg,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: widthDim,
      height: heightDim,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colorFond,
      ),
      margin: EdgeInsets.only(top: topMarg, bottom: bottomMarg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8.0, right: 3.0),
            child: Image.asset(
              logoImg,
            ),
          ),
        ],
      ),
    );
  }
}