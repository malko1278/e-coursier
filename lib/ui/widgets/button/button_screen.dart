
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';

class ButtonScreen extends StatefulWidget {
  final String title;
  final double leftMarg;
  final double topMarg;
  final double rightMarg;
  final double bottomMarg;
  final double leftPad;
  final double topPad;
  final double rightPad;
  final double bottomPad;
  final double heightWid;
  final Color colorWidget;
  final Function () onPressed;
  final double textSize;
  final bool isActive;
  /*
  // final ValueChanged<int> onChange;
  final Function (int) onChange;
  final List<NavBarModel> listNavBarModel;
  */

  const ButtonScreen({
    required this.title,
    required this.leftMarg,
    required this.topMarg,
    required this.rightMarg,
    required this.bottomMarg,
    required this.leftPad,
    required this.topPad,
    required this.rightPad,
    required this.bottomPad,
    required this.heightWid,
    required this.colorWidget,
    required this.onPressed,
    required this.textSize,
    required this.isActive,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    title,
    leftMarg,
    topMarg,
    rightMarg,
    bottomMarg,
    leftPad,
    topPad,
    rightPad,
    bottomPad,
    heightWid,
    colorWidget,
    onPressed,
    textSize,
    isActive,
  );
}

class InitState extends State<ButtonScreen> {
  String _title;
  double _leftMarg;
  double _topMarg;
  double _rightMarg;
  double _bottomMarg;
  double _leftPad;
  double _topPad;
  double _rightPad;
  double _bottomPad;
  double _heightWid;
  Color _colorWidget;
  late Function () _onPressed;
  double _textSize;
  bool _isActive;

  InitState(
    this._title,
    this._leftMarg, this._topMarg, this._rightMarg, this._bottomMarg,
    this._leftPad, this._topPad, this._rightPad, this._bottomPad, this._heightWid,
      this._colorWidget, this._onPressed, this._textSize, this._isActive
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = widget.title;
    _leftMarg = widget.leftMarg;
    _topMarg = widget.topMarg;
    _rightMarg = widget.rightMarg;
    _bottomMarg = widget.bottomMarg;
    _leftPad = widget.leftPad;
    _topPad = widget.topPad;
    _rightPad = widget.rightPad;
    _bottomPad = widget.bottomPad;
    _heightWid = widget.heightWid;
    _onPressed = widget.onPressed;
    _textSize = widget.textSize;
    _isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      margin: EdgeInsets.only(left: _leftMarg, top: _topMarg, right: _rightMarg,),
      child: ElevatedButton(
        onPressed: () {
          if(_isActive) {
            _onPressed();
          }
        },
        style : ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(thirdColor),
          elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              if(_isActive == false) {
                return 0;
              } else {
                if(states.contains(MaterialState.pressed) || states.contains(MaterialState.disabled)) {
                  return 2;
                }
                return 10;
              }
              /*
              if(states.contains(MaterialState.pressed) || states.contains(MaterialState.disabled)) {
                return 2;
              }
              return 10;
              if(_isActive == false) {
                return 0;
              } else {
                if(states.contains(MaterialState.pressed) || states.contains(MaterialState.disabled)) {
                  return 2;
                }
                return 10;
              }
               */
            },
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(_colorWidget),
        ),
        child: Container(
          margin: EdgeInsets.only(left: _leftPad, top: _topPad, right: _rightPad, bottom: _bottomPad),
          child: Text(
            _title,
            style: TextStyle(
              fontSize: _textSize,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}