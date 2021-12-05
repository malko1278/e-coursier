
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';

class TagWidget extends StatefulWidget {
  final double heightPosFirst;
  final double widthPosFirst;
  final double heightPosSec;
  final double widthPosSec;
  final double radiusFirst;
  final double radiusSecd;
  final double posTopThird;
  final double posLeftThird;
  final double widthFIT;
  final double heightFIT;
  final String friendImgTag;
  final String titleTag;
  final double titleSize;

  const TagWidget ({
    required this.heightPosFirst,
    required this.widthPosFirst,
    required this.heightPosSec,
    required this.widthPosSec,
    required this.radiusFirst,
    required this.radiusSecd,
    required this.posTopThird,
    required this.posLeftThird,
    required this.widthFIT,
    required this.heightFIT,
    required this.friendImgTag,
    required this.titleTag,
    required this.titleSize,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    heightPosFirst,
    widthPosFirst,
    heightPosSec,
    widthPosSec,
    radiusFirst,
    radiusSecd,
    posTopThird,
    posLeftThird,
    widthFIT,
    heightFIT,
    friendImgTag,
    titleTag,
    titleSize,
  );
}

class InitState extends State<TagWidget> {
  double _heightPosFirst;
  double _widthPosFirst;
  double _heightPosSec;
  double _widthPosSec;
  double _radiusFirst;
  double _radiusSecd;
  double _posTopThird;
  double _posLeftThird;
  double _widthFIT;
  double _heightFIT;
  String _friendImgTag;
  String _titleTag;
  double _titleSize;

  InitState(
    this._heightPosFirst, this._widthPosFirst, this._heightPosSec, this._widthPosSec,
    this._radiusFirst, this._radiusSecd, this._posTopThird, this._posLeftThird,
    this._widthFIT, this._heightFIT, this._friendImgTag, this._titleTag, this._titleSize,
  );

  @override
  void initState() {
    // TODO: implement initState
    // _initRegime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0,),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 210.0, // 332.0,
              width: 315.0,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: _heightPosFirst,
              width: _widthPosFirst,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30.0,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radiusFirst),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: _widthPosSec,
              height: _heightPosSec,
              margin: EdgeInsets.only(top: 40.0,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radiusSecd),
                image: DecorationImage(
                  image: AssetImage('assets/images/ellipse_two.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: _posTopThird,
            left: _posLeftThird,
            child: Container(
              width: _widthFIT,
              height: _heightFIT,
              child: Image.asset(
                _friendImgTag,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              _titleTag,
              style: TextStyle(
                fontSize: _titleSize,
                color: firstColor,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}