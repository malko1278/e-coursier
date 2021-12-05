
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';

class HeadBar extends StatelessWidget {
  final double leftMarg;
  final double topMarg;
  final double rightMarg;
  final double bottomMarg;
  final Widget menu;
  final Widget logo;
  final Widget profil;

  const HeadBar({
    required this.leftMarg,
    required this.topMarg,
    required this.rightMarg,
    required this.bottomMarg,
    required this.menu,
    required this.logo,
    required this.profil,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      color: thirdColor,
      elevation: 5,
      margin: EdgeInsets.only(left: leftMarg, top: topMarg, right: rightMarg, bottom: bottomMarg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          menu,
          logo,
          profil,
        ],
      ),
    );
  }
}
