
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/ui/widgets/draggable/children/second_child_screen.dart';

import 'children/first_child_screen.dart';
import 'children/third_child_screen.dart';

class DraggableScrollWidget extends StatefulWidget {
  final double initHeight;
  final double minHeight;
  final double maxHeight;
  final Function (int) selectAction;
  final Function (int) nextDraggable;
  // final Function (int) selectAction;
  final int rang;

  const DraggableScrollWidget({
    required this. initHeight,
    required this. minHeight,
    required this. maxHeight,
    required this. selectAction,
    required this. nextDraggable,
    required this. rang,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    initHeight, minHeight, maxHeight, selectAction, nextDraggable, rang,
  );
}

class InitState extends State<DraggableScrollWidget> {
  double _initHeight;
  double _minHeight;
  double _maxHeight;
  late Function (int) _selectAction;
  late Function (int) _nextDraggable;
  late int _position;
  Widget? _chilView;
  late ScrollController _controller;

  InitState(
    this._initHeight, this._minHeight, this._maxHeight, this._selectAction,
    this._nextDraggable, this._position
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initHeight = widget.initHeight;
    _minHeight = widget.minHeight;
    _maxHeight = widget.maxHeight;
    _selectAction = widget.selectAction;
    _nextDraggable = widget.nextDraggable;
    _position = widget.rang;
  }

  @override
  dispose() {
    // TODO: implement initState
    super.dispose();
  }

  _nextChildDraggable() {
    setState(() {

    });
  }

  _nextChild(int elt) {
    setState(() {
      if((elt == 1) || (elt == 3)) {
        _position = 1; // child 2
      }
    });
    _nextDraggable(_position);
  }

  @override
  Widget build(BuildContext context) {

    initListWidgets(ScrollController controller) {
      _controller = controller;
      if(_position == 0) {
        return FirstChildScreen(
          controller: _controller,
          activeEditText: _nextChildDraggable,
          selectAction: _nextChild,
          onPressButton: _nextChildDraggable,
        );
      } else {
        if(_position == 1) {
          return SecondChildScreen(
            controller: _controller,
            selectAction: _nextChild,
            onPressButton: _nextChildDraggable,
          );
        } else {
          if(_position == 2) {
            return ThirdChildScreen(
              controller: _controller,
              selectAction: _nextChild,
              onPressButton: _nextChildDraggable,
            );
          }
        }
      }
      return Container();
    }

    return DraggableScrollableSheet(
      initialChildSize: _initHeight, // 0.21,  //0.495,
      minChildSize: _minHeight, // 0.11,
      maxChildSize: _maxHeight, // 0.495,  // 0.883,
      builder: (context, controller) => Material(
        elevation: 15.0,
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13.0),
          topRight: Radius.circular(13.0),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0,),
                  child: Container(
                    width: 50.0,
                    height: 4.0,
                    color: firstColor,
                  ),
                ),
              ),
              _chilView = initListWidgets(controller),
            ],
          ),
        ),
      ),
    );
  }
}