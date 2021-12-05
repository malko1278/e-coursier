
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/models/data/travel.dart';
import 'package:social_navig/ui/widgets/line_date/line_date_widget.dart';
import 'package:social_navig/util/utils.dart';

import '../../text_widget.dart';
import '../../button/button_screen.dart';

class SlideTwoFour extends StatefulWidget {
  final DateTime contentDate;
  final Function () onBack;
  final Function () onPressed;
  final List<List<Travel>> travelList;

  const SlideTwoFour({
    required this.contentDate,
    required this.onBack,
    required this.onPressed,
    required this.travelList,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
    contentDate,
    onBack,
    onPressed,
    travelList,
  );
}

class InitState extends State<SlideTwoFour> {
  late DateTime? _contentDate;
  late Function () _onBack;
  late Function () _onPressed;
  late List<int> _valueDate;
  late List<List<Travel>> _travelList;

  InitState(this._contentDate, this._onBack, this._onPressed, this._travelList,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contentDate = widget.contentDate;
    _onBack = widget.onBack;
    _onPressed = widget.onPressed;
    _valueDate = List.filled(6, 0);
    _toTransformDate();
  }

  _toTransformDate() {
    if(_contentDate != null) {
      _valueDate = getRealDay(_contentDate!.day, _contentDate!.month, _contentDate!.year);
    }
  }

  @override
  Widget build(BuildContext context) {

    return _contentDate == null
    ? Center(
      child: CircularProgressIndicator(),
    ) : SingleChildScrollView(
      child: Column(
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
            title: 'Шаг 2 из 4',
            alignText: TextAlign.right,
            textSize: 18,
            textColor: Colors.black87,
            textFont: FontWeight.w400,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, top: 12.0, right: 5.0, bottom: 10.0,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
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
                SizedBox(width: 49.0,),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              LineDateWidget(
                index: _valueDate[0],
                leftMarg: 10.0,
                topMarg: 0.0,
                rightMarg: 10.0,
                bottomMarg: 0.0,
                borderColor: Colors.white,
                elevetBtn: 10.0,
                month: getRussianMonth(_valueDate[1]),
                day: getRussianDay(_contentDate!.weekday-1),
                travler: _travelList[0].length,
              ),
              LineDateWidget(
                index: _contentDate!.day,
                leftMarg: 10.0,
                topMarg: 0.0,
                rightMarg: 10.0,
                bottomMarg: 0.0,
                borderColor: firstColor,
                elevetBtn: 10.0,
                month: getRussianMonth(_contentDate!.month),
                day: getRussianDay(_contentDate!.weekday),
                travler: _travelList[1].length,
              ),
              LineDateWidget(
                index: _valueDate[3],
                leftMarg: 10.0,
                topMarg: 0.0,
                rightMarg: 10.0,
                bottomMarg: 0.0,
                borderColor: Colors.white,
                elevetBtn: 10.0,
                month: getRussianMonth(_valueDate[4]),
                day: getRussianDay(_contentDate!.weekday+1),
                travler: _travelList[2].length,
              ),
            ],
          ),
          TextWidget(
            alignement: Alignment.topLeft,
            leftMarg: 10.0,
            topMarg: 35.0,
            rightMarg: 10.0,
            bottomMarg: 0.0,
            title: 'DAY не устанавливает стоимость отправки через\n'
                   'попутчиков, но может предложить примерный\n'
                   'диапазон стоимости отправки\n',
            alignText: TextAlign.left,
            textSize: 14,
            textColor: Colors.black,
            textFont: FontWeight.w600,
          ),
          TextWidget(
            alignement: Alignment.topLeft,
            leftMarg: 20.0,
            topMarg: 0.0,
            rightMarg: 10.0,
            bottomMarg: 0.0,
            title: '.  Документ - 1500-2500 тенге\n'
                   '.  Посылка до 1 кг - 2500-3000 тенге\n'
                   '.  Посылка от 1 до 3 кг - 3000-4500 тенге\n'
                   '.  Посылка от 1 до 3 кг - 4500-6000 тенге\n',
            alignText: TextAlign.left,
            textSize: 14,
            textColor: Colors.black,
            textFont: FontWeight.w400,
          ),
          ButtonScreen(
            title: 'Получить данные отправителей',
            leftMarg: 20.0,
            topMarg: 17.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            leftPad: 0.0,
            topPad: 20.0,
            rightPad: 0.0,
            bottomPad: 20.0,
            heightWid: 65.0,
            colorWidget: firstColor,
            onPressed: _onPressed,
            textSize: 16.0,
            isActive: true,
          ),
        ],
      ),
    );
  }
}