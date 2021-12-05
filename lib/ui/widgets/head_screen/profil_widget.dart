
import 'package:flutter/material.dart';

class ProfilWidget extends StatelessWidget {
  final Function () onPressed;
  final String profilImg;
  final double widthDim;
  final double heightDim;
  const ProfilWidget ({
    required this.onPressed,
    required this.profilImg,
    required this.widthDim,
    required this.heightDim,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: onPressed,
      icon: Image(
        image: AssetImage(profilImg),
        height: heightDim,
        width: widthDim,
      ),
    );
  }
}