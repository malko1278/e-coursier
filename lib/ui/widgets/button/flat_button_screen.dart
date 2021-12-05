
import 'package:flutter/material.dart';

class FlatButtonScreen extends StatefulWidget {
  final double leftMarg;
  final double topMarg;
  final double rightMarg;
  final double bottomMarg;
  final double leftPad;
  final double topPad;
  final double rightPad;
  final double bottomPad;
  final String title;
  final double textSize;
  final Color colorWidget;
  final Function () onPressed;

  const FlatButtonScreen({
    required this.leftMarg,
    required this.topMarg,
    required this.rightMarg,
    required this.bottomMarg,
    required this.leftPad,
    required this.topPad,
    required this.rightPad,
    required this.bottomPad,
    required this.title,
    required this.textSize,
    required this.colorWidget,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    leftMarg,
    topMarg,
    rightMarg,
    bottomMarg,
    leftPad,
    topPad,
    rightPad,
    bottomPad,
    title,
    textSize,
    colorWidget,
    onPressed,
  );
}

class InitState extends State<FlatButtonScreen> {
  double _leftMarg;
  double _topMarg;
  double _rightMarg;
  double _bottomMarg;
  double _leftPad;
  double _topPad;
  double _rightPad;
  double _bottomPad;
  String _title;
  double _textSize;
  Color _colorWidget;
  late Function () _onPressed;

  InitState(
      this._leftMarg, this._topMarg, this._rightMarg, this._bottomMarg,
      this._leftPad, this._topPad, this._rightPad, this._bottomPad,
      this._title, this._textSize, this._colorWidget, this._onPressed
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
    _onPressed = widget.onPressed;
    _textSize = widget.textSize;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      margin: EdgeInsets.only(left: _leftMarg, top: _topMarg, right: _rightMarg, bottom: _bottomMarg),
      child: FlatButton(
        onPressed: _onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          side: BorderSide(
            color: _colorWidget,
            width: 1.0,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(left: _leftPad, top: _topPad, right: _rightPad, bottom: _bottomPad),
          child: Text(
            _title,
            style: TextStyle(
              fontSize: _textSize,
              color: _colorWidget,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}