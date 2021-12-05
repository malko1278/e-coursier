
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_navig/util/utils.dart';

class DropDownButton extends StatefulWidget {
  final double leftPad;
  final double rightPad;
  final double leftMarg;
  final double topMarg;
  final double rightMarg;
  final double heigWidget;
  final double rigWidget;
  final double bordRad;
  final Color colorElt;
  final Color borderColorElt;
  final double borderWidth;
  final String eltValue;
  final List<String> itemsDropBtn;
  final double leftPadDrop;
  final double textSize;
  final int indexDrop;
  final Function (int, String) changeValue;

  const DropDownButton({
    required this.leftPad,
    required this.rightPad,
    required this.leftMarg,
    required this.topMarg,
    required this.rightMarg,
    required this.heigWidget,
    required this.rigWidget,
    required this.bordRad,
    required this.colorElt,
    required this.borderColorElt,
    required this.borderWidth,
    required this.eltValue,
    required this.itemsDropBtn,
    required this.leftPadDrop,
    required this.textSize,
    required this.indexDrop,
    required this.changeValue,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
      leftPad,
      rightPad,
      leftMarg,
      topMarg,
      rightMarg,
      heigWidget,
      rigWidget,
      bordRad,
      colorElt,
      borderColorElt,
      borderWidth,
      eltValue,
      itemsDropBtn,
      leftPadDrop,
      textSize,
      indexDrop,
      changeValue
  );
}

class InitState extends State<DropDownButton> {
  double _leftPad;
  double _rightPad;
  double _leftMarg;
  double _topMarg;
  double _rightMarg;
  double _heigWidget;
  double _rigWidget;
  double _bordRad;
  Color _colorElt;
  Color _borderColorElt;
  double _borderWidth;
  String _eltValue;
  List<String> _itemsDropBtn;
  double _leftPadDrop;
  double _textSize;
  int _indexDrop;
  Function (int, String) _changeValue;

  InitState(
    this._leftPad, this._rightPad, this._leftMarg, this._topMarg, this._rightMarg, this._heigWidget,
    this._rigWidget, this._bordRad, this._colorElt, this._borderColorElt, this._borderWidth,
    this._eltValue, this._itemsDropBtn, this._leftPadDrop, this._textSize, this._indexDrop, this._changeValue,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _leftPad = widget.leftMarg;
    _rightPad = widget.rightPad;
    _leftMarg = widget.leftMarg;
    _topMarg = widget.topMarg;
    _rightMarg = widget.rightMarg;
    _heigWidget = widget.heigWidget;
    _rigWidget = widget.rigWidget;
    _bordRad = widget.bordRad;
    _colorElt = widget.colorElt;
    _borderColorElt = widget.borderColorElt;
    _borderWidth = widget.borderWidth;
    _eltValue = widget.eltValue;
    _itemsDropBtn = widget.itemsDropBtn;
    _leftPadDrop = widget.leftPadDrop;
    _textSize = widget.textSize;
    _indexDrop = widget.indexDrop;
    _changeValue = widget.changeValue;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: _heigWidget,
      width: _rigWidget,
      padding: EdgeInsets.only(left: _leftPad, right: _rightPad),
      margin: EdgeInsets.only(left: _leftMarg, right: _rightMarg, top: _topMarg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_bordRad),
        color: _colorElt,
        border: Border.all(
          color: _borderColorElt,
          width: _borderWidth,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _eltValue, // currently selected item
          items: _itemsDropBtn.map((item) => DropdownMenuItem<String>(
            child: Container(
              width: (MediaQuery.of(context).size.width*0.76),
              padding: EdgeInsets.only(left: _leftPadDrop,),
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    getValue(item)[0], // '$item',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: _textSize,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    getValue(item)[1],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: _textSize,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            value: item,
          )).toList(),
          onChanged: (String? newValue) => setState(() {
            _eltValue = newValue!;
            _changeValue(_indexDrop, newValue);
          }),
        ),
      ),
    );
  }
}