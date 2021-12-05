
import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:social_navig/color/color_constant.dart';

import 'children/four_child_screen.dart';
import 'children/sixth_child_screen.dart';
import 'children/third_child_screen.dart';
import 'children/first_child_screen.dart';
import 'children/second_child_screen.dart';

class SlidingUpPanelWidget extends StatefulWidget {
  final double minHeight;
  final double maxHeight;
  final Function (int) selectAction;
  final Function (int) nextDraggable;
  final int rang;

  const SlidingUpPanelWidget({
    required this. minHeight,
    required this. maxHeight,
    required this. selectAction,
    required this. nextDraggable,
    required this. rang,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    minHeight, maxHeight, selectAction, nextDraggable, rang,
  );
}

class InitState extends State<SlidingUpPanelWidget> {
  double _minHeight;
  double _maxHeight;
  late Function (int) _selectAction;
  late Function (int) _nextDraggable;
  late int _position;

  // Locales variables
  Widget? _chilView;
  late double _heightMax;
  late ScrollController _controller;
  late BorderRadiusGeometry _radius;
  late PanelController _pController;

  InitState(
    this._minHeight, this._maxHeight, this._selectAction,
    this._nextDraggable, this._position
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _minHeight = widget.minHeight;
    _maxHeight = widget.maxHeight;
    _selectAction = widget.selectAction;
    _nextDraggable = widget.nextDraggable;
    _position = widget.rang;

    // Initialize locale variables
    _pController = new PanelController();
    initBorderRadius();
  }

  @override
  dispose() {
    // TODO: implement initState
    super.dispose();
  }

  initBorderRadius() {
    _radius = BorderRadius.only(
      topLeft: Radius.circular(13.0),
      topRight: Radius.circular(13.0),
    );
  }

  initListWidgets(ScrollController controller) {
    _controller = controller;
    // if(_position >= 0) _pController.open();
    if(_position == 0) {
      _pController.open();
      return FirstChildScreen(
        controller: _controller,
        activeEditText: _nextChildDraggable,
        selectAction: _nextChild,
        onPressButton: _nextChildDraggable,
      );
    } else {
      if(_position == 1) {
        _pController.open();
        return SecondChildScreen(
          controller: _controller,
          selectAction: _nextChild,
          onPressButton: _nextChildDraggable,
        );
      } else {
        if(_position == 2) {
          _pController.open();
          return ThirdChildScreen(
            controller: _controller,
            selectAction: _nextChild,
            onPressButton: _nextChildDraggable,
          );
        } else {
          if(_position == 3) {
            return FourChildScreen(
              controller: _controller,
              onPressButton: _nextChildDraggable,
            );
          } else {
            if(_position == 4) {
              /*return FifthChildScreen(
                controller: _controller,
                  onPressBt1: _nextChildDraggable, // Remplacer par une autre fonction qui prend des variables
                  onPressBtn2: _nextChildDraggable,
                  onPressBtn3: _nextChildDraggable,
                  onPressBtn4: _nextChildDraggable,
                  onPressBtn5: _nextChildDraggable,
              );*/
            } else {
              if(_position == 5) {
                return SixthChildScreen(
                  controller: _controller,
                  onPressBt1: _nextChildDraggable, // Remplacer par une autre fonction qui prend des variables
                  onPressBtn2: _nextChildDraggable,
                  onPressBtn3: _nextChildDraggable,
                );
              }
            }
          }
        }
      }
    }
    // return Container(); SixthChildScreen
  }

  _nextChildDraggable() {
    setState(() {
      if(_position == 0) {
        _position = 2; // child 3
        _maxHeight = _heightMax;
        _selectAction(2);
        _pController.close();
        _chilView = initListWidgets(_controller);
      } else {
        if(_position == 1) {
          _position = 3;     // child 4
          _maxHeight = 448;  // _maxHeight = 470;
          _selectAction(9);
          _pController.close();
          _chilView = initListWidgets(_controller);
        } else {
          if(_position == 2) {
            _selectAction(8);
            _maxHeight = 120.0;
            // Action a exécuter au niveau de la page centrale
          } else {
            if(_position == 3) {
              _selectAction(11);
              // _maxHeight = 120.0;
              _pController.close();
              _chilView = initListWidgets(_controller);
              // Action a exécuter au niveau de la page centrale
            }
          }
        }
      }
      // _pController.close();
      // _chilView = initListWidgets(_controller);
    });
  }

  _nextChild(int elt) {
    setState(() {
      if((elt == 1) || (elt == 3)) {
        _position = 1; // child 2
        _maxHeight = 385;
      } else {
        if((elt == 2) || (elt == 4)) {
          _position = 2; // child 3
          _maxHeight = _heightMax;
          _selectAction(2);
        } else {
          if(elt == 7) {
            //
          } else {
            if(elt == 9) {
              // _position = 0; // child 1
              // L'adresse précédente a été sélectionnée
            } else {

            }
          }
        }
      }
      _pController.close();
      _chilView = initListWidgets(_controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    _getManette() {
      _heightMax = _size.height - 110;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 50.0,
                height: 4.0,
                color: firstColor,
              ),
            ),
          ),
        ],
      );
    }

    return SlidingUpPanel(
      minHeight: _minHeight,
      maxHeight: _maxHeight,
      parallaxEnabled: true,
      parallaxOffset: .5,
      borderRadius: _radius,
      renderPanelSheet: true,
      controller: _pController,
      color: thirdColor,
      collapsed: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: _radius
        ),
        child: _getManette(),
      ),
      panelBuilder: (ScrollController controller) => Column(
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
    );
  }
}