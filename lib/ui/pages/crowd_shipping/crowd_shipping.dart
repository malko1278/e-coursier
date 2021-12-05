
import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

import 'package:social_navig/models/data/city.dart';
import 'package:social_navig/models/data/packet.dart';
import 'package:social_navig/models/data/travel.dart';
import 'package:social_navig/ui/widgets/head_bar.dart';
import 'package:social_navig/service/service_api.dart';
import 'package:social_navig/color/color_constant.dart';
import 'package:social_navig/models/slide/slide_model.dart';
import 'package:social_navig/ui/widgets/head_screen/logo_widget.dart';
import 'package:social_navig/ui/widgets/head_screen/menu_widget.dart';
import 'package:social_navig/ui/widgets/slide/slide_item_widget.dart';
import 'package:social_navig/ui/pages/sign_up/registration_screen.dart';
import 'package:social_navig/ui/widgets/head_screen/profil_widget.dart';
import 'package:social_navig/ui/widgets/slide/step_four/slide_for_for.dart';
import 'package:social_navig/ui/widgets/slide/step_four/slide_one_four.dart';
import 'package:social_navig/ui/widgets/slide/step_four/slide_two_four.dart';
import 'package:social_navig/ui/widgets/slide/step_four/slide_three_four.dart';
import 'package:social_navig/ui/widgets/slide/step_four/web_test.dart';
import 'package:social_navig/util/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class CrowdShipping extends StatefulWidget {
  const CrowdShipping({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<CrowdShipping> {
  // List<int> zeros = List.filled(int length, E fill, { bool growable: false }).
  late bool _checkbox;
  late int _currentPage;
  late List<City> _listCities;
  late List<String> _dropValue;
  late List<Packet> _listPakets;
  late PageController _Controller;
  late List<SlideModel> contentSlides;
  late List<List<String>> listValueDropDown;
  late List<List<Travel>> _listTravelsDB;
  // late DateTime _dateNow;
  // late String _labelDate;
  late DateTime? _contentDate;

  late JavascriptRuntime jsRuntime;
  // late Completer<WebViewController> _webController = Completer<WebViewController>();
  late WebViewPlusController _webController;
  late BuildContext _buildContext;
  late bool _validatePayment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialisation();
  }

  initialisation() {
    _currentPage = 0;
    _checkbox = false;
    _listCities = citiesList;
    _listPakets = packetsList;
    _dropValue = <String>[];
    contentSlides = <SlideModel>[];
    _Controller = PageController(initialPage: 0,);
    listValueDropDown = List.filled(3, <String>[]);
    for (int i = 0; i < listValueDropDown.length; i++) {
      listValueDropDown[i] = <String>[];
      if((i == 0) || (i == 1)) {
        if(i == 0) {
          listValueDropDown[i].add('Выберите город отправления');
        } else {
          if(i == 1) {
            listValueDropDown[i].add('Выберите город получения');
          }
        }
        List<String> cities = getCities();
        for (int j = 0; j < (cities.length); j++) {
          listValueDropDown[i].add(cities[j]);
        }
      } else {
        listValueDropDown[i].add('Что вы можете доставить ?');
        List<String> packets = getTypePackets();
        for (int j = 0; j < (packets.length); j++) {
          listValueDropDown[i].add(packets[j]);
        }
      }
      _dropValue.add(listValueDropDown.elementAt(i).elementAt(0));
    }
    _contentDate = null;
    for(var i = 0; i < 4; i++) {
      if(i == 0) {
        contentSlides.add(SlideModel(widgets: _getFirstSlide()));
      } else {
        contentSlides.add(SlideModel(widgets: Container()));
      }
    }
    jsRuntime = getJavascriptRuntime();
    _listTravelsDB = List.filled(3, <Travel>[]);

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    _validatePayment = false;
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    _Controller.dispose();
  }

  _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
      ),
    );
  }

  Widget _getFirstSlide() {
    return SlideOneFour(
      checkbox: _checkbox,
      onCheckBox: _changeCheckBox,
      onBack: _previousPage,
      showValue: _dropValue,
      listValueDropDown: listValueDropDown,
      onPressed: _nextPage,
      changeDropValue: _selectDropValue,
      dateChoice: _contentDate,
      selectDate: _pickDate,
    );
  }

  Widget _getSecondSlide() {
    return SlideTwoFour(
      contentDate: _contentDate!,
      onBack: _previousPage,
      onPressed: _nextPage,
      travelList: _listTravelsDB,
    );
  }

  Widget _getThirdSlide() {
    return SlideThreeFour(
      onBack: _previousPage,
      onPressed: _nextPage,
    );
  }

  Widget _getFourthSlide() {
    return SlideForFor(
      onBack: _previousPage,
      onPressed: _nextPage,
      travelList: _listTravelsDB,
    );
  }

  _changeCheckBox(bool newCheck) {
    setState(() {
      _checkbox = newCheck;
      contentSlides[0] = SlideModel(
        widgets: _getFirstSlide(),
      );
    });
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

  Future<bool> _forFirstNextPage() async {
    late List<int> _valueDate = getRealDay(_contentDate!.day, _contentDate!.month, _contentDate!.year);
    // Retourner la liste des voyages
    for(var i = 0; i < 3; i++) {
      if(i == 0) {
        String dateStr = '${_valueDate[0]}:${_valueDate[1]}:${_valueDate[2]}';
        _listTravelsDB[0] = await getSpecificsTravels(_dropValue[0], _dropValue[1], dateStr);
      } else {
        if(i == 1) {
          String dateStr = '${_contentDate!.day}:${_contentDate!.month}:${_contentDate!.year}';
          _listTravelsDB[1] = await getSpecificsTravels(_dropValue[0], _dropValue[1], dateStr);
        } else {
          String dateStr = '${_valueDate[3]}:${_valueDate[4]}:${_valueDate[5]}';
          _listTravelsDB[2] = await getSpecificsTravels(_dropValue[0], _dropValue[1], dateStr);
        }
      }
    }
    if((_listTravelsDB[0].length > 0) || (_listTravelsDB[1].length > 0) || (_listTravelsDB[2].length > 0)) {
      return true;
    } else return false;
  }

  _executeIncrement(int time) {
    setState(() {
      incrementPage();
      _Controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: time),
        curve: Curves.easeIn,
      );
    });
  }

  _nextPage() async {
    if((_currentPage >= 0) && (_currentPage <= 2)) {
      if(_currentPage == 0) {
        // Vérifier la récupération de toutes les données
        if(_verifDropValue(0) && _verifDropValue(1) && _verifDropValue(2) && (_contentDate != null)) {
          bool conduit = await _forFirstNextPage();
          if(conduit) {
            contentSlides[1] = SlideModel(
              widgets: _getSecondSlide(),
            );
            contentSlides[3] = SlideModel(
              widgets: _getFourthSlide(),
            );
            _executeIncrement(800);
          } else {
            _showToast('На эту дату нет зарегистрированных попутчиков');
          }
        } else {
          // _showToast('Необходимо выбрать данные');
          _showToast('Для выполнения этого действия необходимо выбрать данные');
        }
      } else {
        if(_currentPage == 1) {
          contentSlides[2] = SlideModel(
            widgets: _getThirdSlide(),
          );
          _executeIncrement(600);
        } else {
          if(_currentPage == 2) {
            if (Platform.isAndroid) {
              // Android-specific code
              _paymentDialog();
              /*if(_validatePayment == true) {
                _executeIncrement(1300);
              } else {
                _showToast('Оплата не произведена');
              }*/

            } else if (Platform.isIOS) {
              // iOS-specific code

            }
          }
        }
      }
    } else {
      if(_currentPage == 3) {}
    }
  }

  _verifDropValue(int i) {
    if((_dropValue[i] == listValueDropDown[i][0])) {
      return false;
    }
    return true;
  }

  _previousPage() {
    setState(() {
      if((_currentPage >= 1) && (_currentPage <= 2)) {
        decrementPage();
        _Controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
      } else {
        if(_currentPage == 3) {
          setState(() {
            _currentPage = 0;
          });
          _Controller.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
          initialisation();
        } else {
          if(_currentPage == 0) {
            Navigator.pop(context, false);
          }
        }
      }
    });
  }

  _selectDropValue(int post, String newValue) {
    setState(() {
      _dropValue[post] = newValue;
    });
  }

  _pickDate(DateTime date) {
    _contentDate = date;
    setState(() {
      contentSlides[0] = SlideModel(
        widgets: SlideOneFour(
          checkbox: _checkbox,
          onCheckBox: _changeCheckBox,
          onBack: _previousPage,
          showValue: _dropValue,
          listValueDropDown: listValueDropDown,
          onPressed: _nextPage,
          changeDropValue: _selectDropValue,
          dateChoice: _contentDate,
          selectDate: _pickDate,
        ),
      );
    });
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

  /*Future<int> addFromJS(JavascriptRuntime jsRuntime, int first, int second) async {
    String blocJS = await rootBundle.loadString('assets/js/cloud_pay.js');
    final jsResult = jsRuntime.evaluate(blocJS + """add($first, $second)""");
    final jsStringResult = jsResult.stringResult;
    return int.parse(jsStringResult);
  }*/

  /*Future<int> generateCloudPay(JavascriptRuntime jsRuntime) async {
    String blocJS = await rootBundle.loadString('assets/js/cloud_pay.js');
    final jsResult = jsRuntime.evaluate(blocJS + """add(2, 1)""");
    final jsStringResult = jsResult.stringResult;
    return int.parse(jsStringResult);
  }*/

  _paymentDialog() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, anim1, anim2) {
        _buildContext = context;
        return Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(left: 12, top: 45.0, right: 12),
            height: MediaQuery.of(context).size.height*0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox.expand(
              child: WebViewPlus(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'assets/html/cloud_payment.html',
                onWebViewCreated: (controller) {
                  this._webController = controller;
                },
                javascriptChannels: <JavascriptChannel> {
                  JavascriptChannel(
                    name: 'JavascriptChannel',
                    onMessageReceived: (message) async {
                      print('Javascript: "${message.message}"');
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                            message.message,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => {
                                Navigator.pop(context),
                                Navigator.pop(_buildContext),
                                _validatePayment = true,
                                if(_validatePayment == true) {
                                  _executeIncrement(1300)
                                } else {
                                  _showToast('Оплата не произведена')
                                }
                              },
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );

                      _webController.webViewController.evaluateJavascript('ok()');
                    },
                  ),
                },
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: Offset(0, 1),
            end: Offset(0, 0), // Offset(1, 1),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  _generatedDialog() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(left: 12, top: 45.0, right: 12),
            height: MediaQuery.of(context).size.height*0.6,
            child: SizedBox.expand(
              // child: FlutterLogo(),
              child: WebViewPlus(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'assets/html/index.html',
                // initialUrl: 'https://flutter.dev',
                // initialUrl: 'https://widget.cloudpayments.ru/bundles/cloudpayments',
                onWebViewCreated: (controller) {
                  this._webController = controller;
                  // _loadLocalHTML();
                },
                javascriptChannels: <JavascriptChannel> {
                  JavascriptChannel(
                    name: 'JavascriptChannel',
                    onMessageReceived: (message) async {
                      print('Javascript: "${message.message}"');
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                            message.message,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );

                      _webController.webViewController.evaluateJavascript('ok()');
                    },
                  ),
                },
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: Offset(0, 1),
            end: Offset(0, 0), // Offset(1, 1),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  _loadLocalHTML() async {
    String blocHtml = await rootBundle.loadString('assets/html/index.html');

    final url = Uri.dataFromString(
      blocHtml,
      mimeType: 'test/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();

    _webController.loadUrl(url);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: thirdColor,
      body: Stack(
        children: <Widget>[
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