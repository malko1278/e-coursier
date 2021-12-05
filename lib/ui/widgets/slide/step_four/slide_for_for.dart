
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/models/data/travel.dart';
import 'package:social_navig/ui/widgets/carte_machine/carte_machine_widget.dart';

import '../../text_widget.dart';

class SlideForFor extends StatefulWidget {
  final Function () onBack;
  final Function () onPressed;
  final List<List<Travel>> travelList;

  const SlideForFor({
    required this.onBack,
    required this.onPressed,
    required this.travelList,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    onBack,
    onPressed,
    travelList,
  );
}

class InitState extends State<SlideForFor> {
  late Function () _onBack;
  late Function () _onPressed;
  late List<List<Travel>> _travelList;
  late List<Travel> listTravels;

  InitState(this._onBack, this._onPressed, this._travelList,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onBack = widget.onBack;
    _onPressed = widget.onPressed;
    _travelList = widget.travelList;
    listTravels = <Travel>[];
    for (int i = 0; i < _travelList.length; i++) {
      for (int j = 0; j < _travelList[i].length; j++) {
        listTravels.add(_travelList[i][j]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size _size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 113.0,),
        ),
        TextWidget(
          alignement: Alignment.topRight,
          leftMarg: 0.0,
          topMarg: 0.0,
          rightMarg: 8.0,
          bottomMarg: 0.0,
          title: 'Шаг 4 из 4',
          alignText: TextAlign.right,
          textSize: 18,
          textColor: Colors.black87,
          textFont: FontWeight.w400,
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0, top: 12.0, right: 5.0,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(  // Devra être retiré
                onPressed: _onBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: firstColor,
                  size: 25,
                ),
              ),
              TextWidget(
                alignement: Alignment.center,
                leftMarg: 0.0,
                topMarg: 0.0,
                rightMarg: 0.0,
                bottomMarg: 0.0,
                title: 'Слоты попутчиков',
                alignText: TextAlign.center,
                textSize: 24,
                textColor: firstColor,
                textFont: FontWeight.w600,
              ),
              SizedBox(width: 49.0,),  // Devra être retiré
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(listTravels.length, (index) {
                return CarteMachineWidget(
                  indexVal: (index+1),
                  travel: listTravels[index],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}