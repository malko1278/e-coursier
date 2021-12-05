
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapSlideScreen extends StatefulWidget {
  const MapSlideScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<MapSlideScreen> {

  @override
  Widget build(BuildContext context) {

    return Container(
      color: secondColor,
    );
    // return Expanded(child: YandexMap(),);
  }
}