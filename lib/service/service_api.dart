
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:social_navig/models/data/travel.dart';
import 'package:social_navig/util/utils.dart';

String _urlApiTravels = 'http://192.168.1.11:9000/api/travels';
String _urlApiSaveTravel = 'http://192.168.1.11:9000/api/travels/create';
String _urlApiSpecificTravels = 'http://192.168.1.11:9000/api/travels/specific';

getAllTravels() async {
  Map respServer;
  List<Travel> listTravels = <Travel>[];
  http.Response response = await http.get(Uri.parse(_urlApiTravels));
  if(response.statusCode == 200) {
    respServer = json.decode(response.body);
    // listTravels = respServer['travels'];
    print('La taille est == ${respServer['travels'].length}');
    for(int i = 0; i < respServer['travels'].length; i++) {
      listTravels.add(
        new Travel(
          city_departure: respServer['travels'][i]['city_departure'],
          city_arrival: respServer['travels'][i]['city_arrival'],
          travel_date: respServer['travels'][i]['travel_date'],
          travel_hour: respServer['travels'][i]['travel_hour'],
          transport: respServer['travels'][i]['transport'],
          type_packet: respServer['travels'][i]['type_packet'],
          quantity: respServer['travels'][i]['quantity'],
          phone_number: respServer['travels'][i]['phone_number'],
        ),
      );
    }
  }
}

Future<List<Travel>> getSpecificsTravels(String cityDep, String cityArriv, String date) async {
  Map respServer;
  List<Travel> listTravels = <Travel>[];
  http.Response response = await http.post(Uri.parse(_urlApiSpecificTravels), body: {
    'city_departure': cityDep.toString(),
    'city_arrival': cityArriv.toString(),
    'travel_date': date.toString(),
  });
  if(response.statusCode == 200) {
    respServer = json.decode(response.body);
    for(int i = 0; i < respServer['travels'].length; i++) {
      listTravels.add(
        new Travel(
          city_departure: respServer['travels'][i]['city_departure'],
          city_arrival: respServer['travels'][i]['city_arrival'],
          travel_date: respServer['travels'][i]['travel_date'],
          travel_hour: respServer['travels'][i]['travel_hour'],
          transport: respServer['travels'][i]['transport'],
          type_packet: respServer['travels'][i]['type_packet'],
          quantity: respServer['travels'][i]['quantity'],
          phone_number: respServer['travels'][i]['phone_number'],
        ),
      );
    }
  }
  return listTravels;
}

/*
Future<Travel?> saveTravelToDB(String cityDepart, String cityArriv, String date, String hour,
                              String auto, String packet, String phoneNumber, File? document) async {
*/
Future<bool> saveTravelToDB(String cityDepart, String cityArriv, String date, String hour,
      String auto, String packet, String phoneNumber, File? document) async {
  String str = '';
  if(document != null) {
    str = document.toString();
  }
  final response = await http.post(Uri.parse(_urlApiSaveTravel), body: {
    'ident': 'SOCIAL_000001',
    'city_departure': cityDepart,
    'city_arrival': cityArriv,
    'travel_date': date,
    'travel_hour': hour,
    'transport': auto,
    'type_packet': getValue(packet)[0],
    'quantity': getValue(packet)[1],
    'phone_number': phoneNumber,
    'file_document': str,
  });
  if(response.statusCode == 201) {
    return true; // return travelFromJson(response.body);
  }
  return false;
}