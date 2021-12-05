
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:social_navig/util/utils.dart';
import 'package:social_navig/service/service_api.dart';
import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/models/slide/slide_model.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/widgets/slide/slide_item_widget.dart';
import 'package:social_navig/ui/pages/sign_up/registration_screen.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';
import 'package:social_navig/ui/widgets/slide/step_two/slide_one_two.dart';
import 'package:social_navig/ui/widgets/slide/step_two/slide_two_two.dart';

class BecomeCompagnon extends StatefulWidget {
  const BecomeCompagnon({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<BecomeCompagnon> {
  late bool _checkbox;
  late int _currentPage;
  late List<String> _dropValue;
  late PageController _Controller;
  late List<SlideModel> contentSlides;
  late List<List<String>> listValueDropDown;
  late DateTime? _contentDate;
  late String _phoneNumber;

  late File _travelDocument;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPage = 0;
    _checkbox = false;
    _dropValue = <String>[];
    _Controller = PageController(initialPage: 0,);
    _phoneNumber = '';
    contentSlides = <SlideModel>[];
    listValueDropDown = List.filled(5, <String>[]);
    initialization();

    // _travelObject
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    _Controller.dispose();
  }

  initialization() async {
    for (int i = 0; i < listValueDropDown.length; i++) {
      listValueDropDown[i] = <String>[];
      if((i == 0) || (i == 1)) {
        if(i == 0) {
          listValueDropDown[i].add('Откуда выедите ?');
        } else {
          if(i == 1) {
            listValueDropDown[i].add('Куда выедите ?');
          }
        }
        List<String> cities = getCities();
        for (int j = 0; j < (cities.length); j++) {
          listValueDropDown[i].add(cities[j]);
        }
      } else {
        if(i == 2) {
          listValueDropDown[i].add('Время поездки');
          List<String> listMoment = getTravalsMoment();
          for (int j = 0; j < (listMoment.length); j++) {
            listValueDropDown[i].add(listMoment[j]);
          }
        } else {
          if(i == 3) {
            listValueDropDown[i].add('Вид транспорта');
            List<String> transports = getTransports();
            for (int j = 0; j < (transports.length); j++) {
              listValueDropDown[i].add(transports[j]);
            }
          } else {
            if(i == 4) {
              listValueDropDown[i].add('Что вы можете доставить ?');
              List<String> packets = getTypePackets();
              for (int j = 0; j < (packets.length); j++) {
                listValueDropDown[i].add(packets[j]);
              }
            }
          }
        }
      }
      _dropValue.add(listValueDropDown.elementAt(i).elementAt(0));
    }
    _contentDate = null;
    for(var i = 0; i < 4; i++) {
      contentSlides.add(SlideModel(widgets: getWidget(i)));
    }
  }

  incrementPage() {
    setState(() {
      _currentPage++;
    });
  }

  decrementPage() {
    setState(() {
      _currentPage--;
    });
  }

  _nextPage(String number) {
    setState(() {
      if(_currentPage == 0) {
        incrementPage();
        _Controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
      } else {
        if(_currentPage == 1) {
          _saveTravel();
        }
      }
    });
  }

  _previousPage() {
    setState(() {
      if(_currentPage == 1) {
        decrementPage();
        _Controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
      } else {
        if(_currentPage == 0) {
          Navigator.pop(context, false);
        }
      }
    });
  }

  _changeCheckBox(bool newCheck, String phoneNumb) {
    setState(() {
      _checkbox = newCheck;
      _phoneNumber = phoneNumb;
      contentSlides[0] = SlideModel(
        widgets: SlideOneTwo(
          checkbox: _checkbox,
          onCheckBox: _changeCheckBox,
          onBack: _previousPage,
          showValue: _dropValue,
          listValueDropDown: listValueDropDown,
          onPressed: _nextPage,
          changeDropValue: _selectDropValue,
          dateChoice: _contentDate,
          selectDate: _pickDate,
          phoneNumber: _phoneNumber,
          onTakeFile: _takeFilePath,
        ),
      );
    });
  }

  _selectDropValue(int post, String newValue) {
    setState(() {
      _dropValue[post] = newValue;
    });
  }

  _takeFilePath(File fileObject) {
    _travelDocument = fileObject;
  }

  _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
      ),
    );
  }

  _saveTravel() async {
    String date = '${_contentDate!.day}:${_contentDate!.month}:${_contentDate!.year}';
    bool _result = await saveTravelToDB(_dropValue[0], _dropValue[1], date, _dropValue[2], _dropValue[3], _dropValue[4], _phoneNumber, _travelDocument);
    if(_result == true) {
      _showToast('Регистрация поездки осуществляется');
      Navigator.pop(context, false);
    }
  }

  void _showToast(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(label: 'ОТМЕНИТЬ', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Widget getWidget(int index) {
    if(index == 0) {
      return SlideOneTwo(
        checkbox: _checkbox,
        onCheckBox: _changeCheckBox,
        onBack: _previousPage,
        showValue: _dropValue,
        listValueDropDown: listValueDropDown,
        onPressed: _nextPage,
        changeDropValue: _selectDropValue,
        dateChoice: _contentDate,
        selectDate: _pickDate,
        phoneNumber: _phoneNumber,
        onTakeFile: _takeFilePath,
      );
    } else {
      if(index == 1) {
        return SlideTwoTwo(
          onBack: _previousPage,
          onPressed: _nextPage,
        );
      }
    }
    return Container();
  }

  _pickDate(DateTime date) {
    _contentDate = date;
    setState(() {
      contentSlides[0] = SlideModel(
        widgets: SlideOneTwo(
          checkbox: _checkbox,
          onCheckBox: _changeCheckBox,
          onBack: _previousPage,
          showValue: _dropValue,
          listValueDropDown: listValueDropDown,
          onPressed: _nextPage,
          changeDropValue: _selectDropValue,
          dateChoice: _contentDate,
          selectDate: _pickDate,
          phoneNumber: _phoneNumber,
          onTakeFile: _takeFilePath,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: thirdColor,
      body: Stack(
        children: <Widget>[
          /*
          _isInitialize == false
          ? Center(
            child: CircularProgressIndicator(),
          ) : PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _Controller,
            itemCount: contentSlides.length,
            itemBuilder: (ctx, i) => SlideItemWidget(
              index: i,
              listSlides: contentSlides,
            ),
          ),
           */
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _Controller,
            itemCount: contentSlides.length,
            itemBuilder: (ctx, i) => SlideItemWidget(
              index: i,
              listSlides: contentSlides,
            ),
          ),
          HeadBar(
            leftMarg: 10.0,
            topMarg: 40.0,
            rightMarg: 10.0,
            bottomMarg: 0.0,
            menu: MenuWidget(
              profilImg: 'assets/images/img_menu.png',
              heightDim: 20.0,
              widthDim: 30.0,
            ),
            logo: LogoWidget(
              logoImg: 'assets/images/simple_logo.png',
              colorFond: secondColor,
              heightDim: 50.0,
              widthDim: 50.0,
              topMarg: 5.0,
              bottomMarg: 5.0,
            ),
            profil: ProfilWidget(
              onPressed: _signUp,
              profilImg: 'assets/images/profil_img.png',
              heightDim: 30.0,
              widthDim: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}