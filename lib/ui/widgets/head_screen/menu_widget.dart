
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final String profilImg;
  final double widthDim;
  final double heightDim;
  const MenuWidget ({
    required this.profilImg,
    required this.widthDim,
    required this.heightDim,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: () {},
      icon: Image(
        image: AssetImage(profilImg),
        height: heightDim,
        width: widthDim,
      ),
    );
  }
}