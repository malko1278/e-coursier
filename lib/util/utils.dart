
import 'package:intl/intl.dart';
import 'package:social_navig/models/data/city.dart';
import 'package:social_navig/models/data/packet.dart';
import 'package:social_navig/models/data/transport.dart';
import 'package:social_navig/models/data/travel_moment.dart';

String getRussianMonth(int valMonth) {
  String month = '';
  switch(valMonth) {
    case 1:   month = 'Января';   break;
    case 2:   month = 'Февраля';   break;
    case 3:   month = 'Марта';   break;
    case 4:   month = 'Апреля';   break;
    case 5:   month = 'Мая';   break;
    case 6:   month = 'Июня';   break;
    case 7:   month = 'Июля';   break;
    case 8:   month = 'Августа';   break;
    case 9:   month = 'Сентября';   break;
    case 10:   month = 'Октября';   break;
    case 11:   month = 'Ноября';   break;
    case 12:   month = 'Декабря';   break;
  }
  return month;
}

String getRussianDay(int valDay) {
  String day = '';
  if(valDay == 0) {
    valDay = 7;
  } else {
    if(valDay == 8) {
      valDay = 1;
    }
  }
  switch(valDay) {
    case 1:   day = 'Понедельник';   break;
    case 2:   day = 'Вторник';   break;
    case 3:   day = 'Среда';   break;
    case 4:   day = 'Четверг';   break;
    case 5:   day = 'Пятница';   break;
    case 6:   day = 'Суббота';   break;
    case 7:   day = 'Воскресенье';   break;
  }
  return day;
}


var parsedDate = DateTime.parse('1974-03-20 00:00:00.000');
// var dateTime1 = DateFormat('d/M/yyyy').parse(dmyString);


List<int> separateDate(String valeur) {
  List<int> listValue = List.filled(3, 0);
  int i = 0;
  bool first = false;
  bool second = false;
  String str = '';
  while(i < valeur.length) {
    if(first == false) {
      if(valeur[i] != ':') {
        str += valeur[i];
      } else {
        first = true;
        listValue[0] = int.parse(str);
        str = '';
      }
    } else {
      if(second == false) {
        if(valeur[i] != ':') {
          str += valeur[i];
        } else {
          first = true;
          listValue[1] = int.parse(str);
          str = '';
        }
      } else {
        if(i < valeur.length) {
          str += valeur[i];
        } else {
          listValue[2] = int.parse(str);
        }
      }
    }
    i++;
  }
  return listValue;
}

List<String> getValue(String valeur) {
  List<String> month = List.filled(2, '');
  int i = 0;
  bool first = false;
  bool second = false;
  while(i < valeur.length) {
    if(first == false) {
      if(valeur[i] != ';') {
        month[0] += valeur[i];
      } else {
        first = true;
      }
    } else {
      if((first == true) && (second == false)) {
        if(i < valeur.length) {
          month[1] += valeur[i];
        } else {
          second = true;
        }
      }
    }
    i++;
  }
  return month;
}

List<String> getRealDate(String valeur) {
  List<String> month = List.filled(2, '');
  int i = 0;
  bool first = false;
  bool second = false;
  while(i < valeur.length) {
    if(first == false) {
      if(valeur[i] != ';') {
        month[0] += valeur[i];
      } else {
        first = true;
      }
    } else {
      if((first == true) && (second == false)) {
        if(i < valeur.length) {
          month[1] += valeur[i];
        } else {
          second = true;
        }
      }
    }
    i++;
  }
  return month;
}

List<int> getRealDay(int day, int monthNum, int year) {
  List<int> month = List.filled(6, 0);
  // var dateUtility = new DateUtil();
  if(day == 1) {
    if(monthNum == 1) {
      month[0] = 31;
      month[1] = 12;
      month[2] = year-1;
    } else {
      month[0] = DateTime(year, monthNum, 0).day;
      month[1] = monthNum-1;
      month[2] = year;
    }
    month[3] = day+1;
    month[4] = monthNum;
    month[5] = year;
  } else {
    if(day == 31) {
      month[0] = day-1;
      month[1] = monthNum;
      month[2] = year;
      if(monthNum == 12) {
        month[3] = 1;
        month[4] = 1;
        month[5] = year+1;
      } else {
        month[3] = 1;
        month[4] = monthNum+1;
        month[5] = year;
      }
    } else {
      if(day == 30) {
        month[0] = day-1;
        month[1] = monthNum;
        month[2] = year;
        if((monthNum == 4) || (monthNum == 6) || (monthNum == 9) || (monthNum == 11)) {
          month[3] = 1;
          month[4] = monthNum+1;
          month[5] = year;
        } else {
          month[3] = day+1;
          month[4] = monthNum;
          month[5] = year;
        }
      } else {
        if(day == 28) {
          month[0] = day-1;
          month[1] = monthNum;
          month[2] = year;
          if(DateTime(year, monthNum).day == day) {
            month[3] = 1;
            month[4] = monthNum+1;
            month[5] = year;
          } else {
            month[3] = day+1;
            month[4] = monthNum;
            month[5] = year;
          }
        } else {
          if(day == 29) {
            month[0] = day-1;
            month[1] = monthNum;
            month[2] = year;
            if(DateTime(year, monthNum).day == day) {
              month[3] = 1;
              month[4] = monthNum+1;
              month[5] = year;
            } else {
              month[3] = day+1;
              month[4] = monthNum;
              month[5] = year;
            }
          } else {
            month[0] = day-1;
            month[1] = monthNum;
            month[2] = year;
            month[3] = day+1;
            month[4] = monthNum;
            month[5] = year;
          }
        }
      }
    }
  }
  return month;
}

String getRussianGender(int genre) {
  if(genre >= 2) {
    return 'попутчиков';
  } else {
    return 'попутчик';
  }
}

List<String> getTravalsMoment() {
  List<String> listMoment = <String>[];
  for(int i = 0; i < travMomentList.length; i++) {
    listMoment.add(travMomentList[i].hour);
  }
  return listMoment;
}

List<String> getTravalsMomentByDate(String date) {
  List<String> listMoment = <String>[];
  for(int i = 0; i < travMomentList.length; i++) {
    print('date == $date');
    print('travMomentList[i].date == ${travMomentList[i].date}');
    if(date == travMomentList[i].date) {
      listMoment.add(travMomentList[i].hour);
    }
  }
  return listMoment;
}

List<String> getTransports() {
  List<String> listTransports = <String>[];
  for(int i = 0; i < transportList.length; i++) {
    listTransports.add(transportList[i].name);
  }
  return listTransports;
}

List<String> getTypePackets() {
  List<String> listTypes = <String>[];
  for(int i = 0; i < packetsList.length; i++) {
    listTypes.add('${packetsList[i].name};${packetsList[i].quantity}');
  }
  return listTypes;
}

List<String> getCities() {
  List<String> listCities = <String>[];
  for(int i = 0; i < citiesList.length; i++) {
    listCities.add(citiesList[i].name);
  }
  return listCities;
}

String getNewValue(String value) {
  String text = '';
  if(value.length == 1) {
    if(value != '+') {
      text = '+';
    }
  } else {
    if(value.length == 2) {
      text = '$value (';
    } else {
      if(value.length == 7) {
        text = '$value) ';
      } else {
        if((value.length == 12) || (value.length == 15)) {
          text = '$value-';
        }
      }
    }
  }
  return text;
}

String getHtmlPageT() {
  return '''
    <!DOCTYPE html>
    <html>
      <head><title>Navigation Delegate Example</title></head>
      <body>
        <h1>This is heading 1</h1>
        <h2>This is heading 2</h2>
        <h3>This is heading 3</h3>
        <h4>This is heading 4</h4>
        <h5>This is heading 5</h5>
        <h6>This is heading 6</h6>
      </body>
    </html>
    ''';
}

String getHtmlPage() {
  return '''
    <!DOCTYPE html>
    <html>
      <head><title>Navigation Delegate Example</title></head>
      <body>
        <p>The navigation delegate is set to block navigation to the youtube website.</p>
        <ul>
          <ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
          <ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
        </ul>
      </body>
    </html>
    ''';
}