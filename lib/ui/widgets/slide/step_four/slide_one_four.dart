
import 'package:flutter/material.dart';

import 'package:social_navig/color/color_constant.dart';

import '../../text_widget.dart';
import '../../date_selector.dart';
import '../../button/button_screen.dart';
import '../../drop_down/drop_down_button.dart';
import '../../drop_down/drop_down_button_widget.dart';

class SlideOneFour extends StatefulWidget {
  final bool checkbox;
  final Function (bool) onCheckBox;
  final Function () onBack;
  final List<String> showValue;
  final List<List<String>> listValueDropDown;
  final Function () onPressed;
  final Function (int, String) changeDropValue;
  final DateTime? dateChoice;
  final Function (DateTime) selectDate;

  const SlideOneFour({
    required this.checkbox,
    required this.onCheckBox,
    required this.onBack,
    required this.showValue,
    required this.listValueDropDown,
    required this.onPressed,
    required this.changeDropValue,
    required this.dateChoice,
    required this.selectDate,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState(
      checkbox,
      onCheckBox,
      onBack,
      showValue,
      listValueDropDown,
      onPressed,
      changeDropValue,
      dateChoice,
      selectDate,
  );
}

class InitState extends State<SlideOneFour> {
  late bool _checkbox;
  late Function (bool) _onCheckBox;
  late Function () _onBack;
  late List<String> _showValue;
  late List<List<String>> _listValueDropDown;
  late Function () _onPressed;
  late Function (int, String) _changeDropValue;
  late DateTime? _dateChoice;
  late Function (DateTime) _selectDate;

  late List<bool> _buttonValid;
  late String _titleDate;
  late DateSelector _dateSelector;

  InitState(
    this._checkbox, this._onCheckBox, this._onBack, this._showValue, this._listValueDropDown,
    this._onPressed, this._changeDropValue, this._dateChoice, this._selectDate,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkbox = widget.checkbox;
    _onCheckBox = widget.onCheckBox;
    _onBack = widget.onBack;
    _showValue = widget.showValue;
    _listValueDropDown = widget.listValueDropDown;
    _onPressed = widget.onPressed;
    _changeDropValue = widget.changeDropValue;
    _dateChoice = widget.dateChoice;
    _selectDate = widget.selectDate;
    _buttonValid = List.filled(2, !_checkbox);
    _buttonValid[1] = _checkbox;
    if(_dateChoice == null) {
      _titleDate = 'Дата доставки';
    } else {
      _titleDate = 'Дата доставки :   ${_dateChoice!.day}:${_dateChoice!.month}:${_dateChoice!.year}';
    }
    _dateSelector = _getDateSelector();
  }

  _regleAccepted() {
    setState(() {
      _checkbox = !_checkbox;
      _onCheckBox(_checkbox);
      _buttonValid[0] = !_checkbox;
      _buttonValid[1] = _checkbox;
    });
  }

  _pickDate() async {
    DateTime? _date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year-5),
      lastDate: DateTime(DateTime.now().year+5),
      initialDate: DateTime.now(),
    );
    if(_date != null) {
      setState(() {
        _dateChoice = _date;
        _titleDate = 'Дата доставки :   ${_date.day}:${_date.month}:${_date.year}';
        _dateSelector = _getDateSelector();
        _selectDate(_dateChoice!);
      });
    }
  }

  _getDateSelector() {
    return DateSelector(
      heigWid: 60.0,
      leftMarg: 20.0,
      topMarg: 30.0,
      rigMarg: 20.0,
      bottMarg: 0.0,
      circular: 5.0,
      bordWidth: 1.0,
      textWidget: TextWidget(
        alignement: Alignment.centerLeft,
        leftMarg: 20.0,
        topMarg: 14.0,
        rightMarg: 0.0,
        bottomMarg: 14.0,
        title: _titleDate,
        alignText: TextAlign.left,
        textSize: 14.0,
        textColor: Colors.black87,
        textFont: FontWeight.w400,
      ),
      onPressed: _pickDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
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
            title: 'Шаг 1 из 4',
            alignText: TextAlign.right,
            textSize: 18,
            textColor: Colors.black87,
            textFont: FontWeight.w400,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, top: 12.0, right: 5.0),
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
                  title: 'Оформить отправку',
                  alignText: TextAlign.center,
                  textSize: 24,
                  textColor: firstColor,
                  textFont: FontWeight.w600,
                ),
                SizedBox(width: 49.0,),
              ],
            ),
          ),
          DropDownButtonWidget(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 30.0,
            rightMarg: 20.0,
            heigWidget: 60.0,
            rigWidget: _size.width,
            bordRad: 5.0,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltValue: _showValue.elementAt(0),
            itemsDropBtn: _listValueDropDown.elementAt(0),
            leftPadDrop: 0.0,
            textSize: 14.0,
            indexDrop: 0,
            changeValue: _changeDropValue,
          ),
          DropDownButtonWidget(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 30.0,
            rightMarg: 20.0,
            heigWidget: 60.0,
            rigWidget: _size.width,
            bordRad: 5.0,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltValue: _showValue.elementAt(1),
            itemsDropBtn: _listValueDropDown.elementAt(1),
            leftPadDrop: 0.0,
            textSize: 14.0,
            indexDrop: 1,
            changeValue: _changeDropValue,
          ),
          _dateSelector,
          TextWidget(
            alignement: Alignment.topLeft,
            leftMarg: 20.0,
            topMarg: 4.0,
            rightMarg: 20.0,
            bottomMarg: 0.0,
            title: 'Будет выбрана дата +/- 1 день',
            alignText: TextAlign.left,
            textSize: 13,
            textColor: Colors.black87,
            textFont: FontWeight.w400,
          ),
          DropDownButton(
            leftPad: 10.0,
            rightPad: 10.0,
            leftMarg: 20.0,
            topMarg: 20.0,
            rightMarg: 20.0,
            heigWidget: 60.0,
            rigWidget: _size.width,
            bordRad: 5.0,
            colorElt: Colors.white,
            borderColorElt: Colors.grey.shade500,
            borderWidth: 1.0,
            eltValue: _showValue.elementAt(2),
            itemsDropBtn: _listValueDropDown.elementAt(2),
            leftPadDrop: 0.0,
            textSize: 14.0,
            indexDrop: 2,
            changeValue: _changeDropValue,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  margin: EdgeInsets.only(top: 2.0,),
                  child: Checkbox(
                    value: _checkbox,
                    onChanged: (value) => _regleAccepted(),
                  ),
                ),
                TextWidget(
                  alignement: Alignment.topLeft,
                  leftMarg: 5.0,
                  topMarg: 0.0,
                  rightMarg: 0.0,
                  bottomMarg: 0.0,
                  title: 'Я принимаю правила работы сервиса и\n'
                         'ознакомлен со Списком запрещенных к\n'
                         'отправке посылок',
                  alignText: TextAlign.left,
                  textSize: 14.0,
                  textColor: Colors.black,
                  textFont: FontWeight.w300,
                ),
              ],
            ),
          ),
          Visibility(
            visible: _buttonValid[0],
            child: ButtonScreen(
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
              isActive: false,
            ),
          ),
          Visibility(
            visible: _buttonValid[1],
            child: ButtonScreen(
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
          ),
        ],
      ),
    );
  }
}
