
import 'package:flutter/material.dart';
import 'package:social_navig/color/color_constant.dart';

class ToogleWidget extends StatefulWidget {
  final bool tooglState;
  final Function (bool) tooglChang;

  const ToogleWidget({
    required this.tooglState,
    required this.tooglChang,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
      tooglState, tooglChang
  );
}

class InitState extends State<ToogleWidget> {
  bool _tooglState;
  late Function (bool) _tooglChang;

  InitState(this._tooglState, this._tooglChang);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tooglState = widget.tooglState;
    _tooglChang = widget.tooglChang;
    print('InitState ToogleScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: 20.0,
        width: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _tooglState? Colors.grey.shade600.withOpacity(0.5) : firstColor,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 800),
              curve: Curves.easeIn,
              top: 2.5,
              left: _tooglState? 0.0 : 18.0,
              right: _tooglState? 18.0 : 0.0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _tooglState = !_tooglState;
                    _tooglChang(_tooglState);
                  });
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 800),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition( // RotationTransition(
                      child: child,
                      scale: animation,  // turns: animation,
                    );
                  },
                  child: _tooglState?  Icon(
                    Icons.circle,
                    color: Colors.grey.shade100,
                    size: 15.0,
                    key: UniqueKey(),
                  ) : Icon(
                    Icons.circle,
                    color: Colors.grey.shade100,
                    size: 15.0,
                    key: UniqueKey(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}