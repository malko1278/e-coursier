
import 'package:flutter/material.dart';

import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/models/slide/slide_model.dart';
import 'package:social_navig/ui/widgets/button/button_screen.dart';
import 'package:social_navig/ui/widgets/slide/slide_item_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';
import 'package:social_navig/ui/widgets/slide/navig/map_slide_screen.dart';
import 'package:social_navig/ui/widgets/draggable/sliding_up_panel_widget.dart';
import 'package:social_navig/ui/widgets/slide/navig/valid_delivery_slide_screen.dart';
import 'package:social_navig/ui/widgets/slide/navig/config_delivery_slide_screen.dart';
import 'package:social_navig/ui/widgets/slide/navig/organised_delivery_slide_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<NavigationScreen> {
  late bool _ButtonBack;
  late int _position;
  late double _minHeight;
  late double _maxHeight;
  late int _currentPage;
  late bool _checkbox;
  late String _dropValue;
  late PageController _Controller;
  late List<SlideModel> _contentSlides;
  late List<String> _listValueDropDown;
  late Widget _slideUpWidget;
  late List<bool> _isVisibleWidget;
  late List<double> _positionWidget;
  late Size _sizePhone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ButtonBack = false;
    _position = 0;
    _currentPage = 0;
    _checkbox = false;
    _contentSlides = <SlideModel>[];
    _isVisibleWidget = List.filled(3, false);
    _positionWidget = List.filled(9, 0.0);
    _Controller = PageController(initialPage: 0,);
    _listValueDropDown = <String>[];
    for (int j = 0; j < 6; j++) {
      _listValueDropDown.add('Вид передвижения_${j}');
    }
    _dropValue = _listValueDropDown.elementAt(0);
    _slideUpWidget = _getSlideUpWidget();
  }

  _signUp() {

  }

  incrementPage() {
    setState(() {
      _currentPage++;
      if(_currentPage < _contentSlides.length) {
        _Controller.jumpToPage(_currentPage);
      } else {
        // It's not possible to that
      }
    });
  }

  decrementPage() {
    setState(() {
      _currentPage--;
      if(_currentPage >= 0) {
        _Controller.jumpToPage(_currentPage);
      } else {
        // It's not possible to that
      }
    });
  }

  _onChecked(bool value) {
    _checkbox = value;
  }

  _getSlideUpWidget() {
    _minHeight = 30.0;
    _maxHeight = 400.0;
    return SlidingUpPanelWidget(
      minHeight: _minHeight,
      maxHeight: _maxHeight,
      rang: _position,
      selectAction: _showHideIconBack,
      nextDraggable: _nextChild,
    );
  }

  _showHideIconBack(int elt) {
    setState(() {
      if(elt == 2) {
        _ButtonBack = true;
      } else {
        if(elt == 9) {
          incrementPage();
          // Adresse de livraison
          /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrganisedDelivryScreen(),
            ),
          );*/
        } else {
          if(elt == 8) {
            _currentPage = 0;
            _Controller.jumpToPage(_currentPage);
          } else {
            if(elt == 11) {
              _currentPage = 0;
              _Controller.jumpToPage(_currentPage);
              // A revoir
              _isVisibleWidget[1] = true;
              _positionWidget[4] = _sizePhone.height - 95.0;
            }
          }
        }
      }
    });
  }

  _nextChild(int elt) {
    setState(() {

    });
  }

  _getPosition() {
    _positionWidget[3] = 20.0;
    _positionWidget[4] = _sizePhone.height - 180.0;
    _positionWidget[5] = 20.0;
    _positionWidget[6] = 20.0;
    _positionWidget[7] = _sizePhone.height - 95.0;
    _positionWidget[8] = 20.0;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    Widget getWidget(int index) {
      switch(index) {
        case 0:  return MapSlideScreen();
        case 1:  return OrganisedDeliverySlideScreen(
          checked: _checkbox,
          onChecked: _onChecked,
          toCommand: incrementPage,
        );
        case 2:  return ConfigDeliverySlideScreen(toCommand: incrementPage,);
        case 3:  return ValidDeliverySlideScreen();
        case 4:  return ValidDeliverySlideScreen();
      }
      return Container();
    }

    for(var i = 0; i < 4; i++) {
      _contentSlides.add(SlideModel(widgets: getWidget(i)));
    }

    Color getBackgrColor() {
      _sizePhone = _size;
      _getPosition();
      return thirdColor;
    }

    return Scaffold(
      backgroundColor: getBackgrColor(),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _Controller,
            itemCount: _contentSlides.length,
            itemBuilder: (ctx, i) => SlideItemWidget(
              index: i,
              listSlides: _contentSlides,
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
          _slideUpWidget,
          Positioned(
            left: 0.0,
            top: 167.0,
            child: Visibility(
              visible: _ButtonBack,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: firstColor,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            left: _positionWidget[3],
            top: _positionWidget[4],
            right: _positionWidget[5],
            child: Visibility(
              visible: _isVisibleWidget.elementAt(1),
              child: ButtonScreen(
                title: 'Позвонить курьеру',
                leftMarg: 0.0,
                topMarg: 0.0,
                rightMarg: 0.0,
                bottomMarg: 0.0,
                leftPad: 0.0,
                topPad: 20.0,
                rightPad: 0.0,
                bottomPad: 20.0,
                heightWid: 65.0,
                colorWidget: firstColor,
                onPressed: () {
                  setState(() {
                    if(_isVisibleWidget[2] != true) {
                      _isVisibleWidget[2] = true;
                      _positionWidget[4] = _sizePhone.height - 180.0;
                      _positionWidget[7] = _sizePhone.height - 95.0;
                    } else {
                      _currentPage = 4;
                      _Controller.jumpToPage(_currentPage);
                    }
                  });
                },
                textSize: 16.0,
                isActive: true,
              ),
            ),
          ),
          Positioned(
            left: _positionWidget[6],
            top: _positionWidget[7],
            right: _positionWidget[8],
            child: Visibility(
              visible: _isVisibleWidget.elementAt(2),
              child: ButtonScreen(
                title: 'Выхожу',
                leftMarg: 0.0,
                topMarg: 0.0,
                rightMarg: 0.0,
                bottomMarg: 0.0,
                leftPad: 0.0,
                topPad: 20.0,
                rightPad: 0.0,
                bottomPad: 20.0,
                heightWid: 65.0,
                colorWidget: firstColor,
                onPressed: () {},
                textSize: 16.0,
                isActive: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}