
import 'dart:convert';

Travel travelFromJson(String str) => Travel.fromJson(json.decode(str));

String travelToJson(Travel travel) => json.encode(travel.toJson());

class Travel {
  String? ident;
  String city_departure;
  String city_arrival;
  String travel_date;
  String travel_hour;
  String transport;
  String type_packet;
  String quantity;
  String phone_number;
  String? file_document;

  Travel({
    this.ident,
    required this.city_departure,
    required this.city_arrival,
    required this.travel_date,
    required this.travel_hour,
    required this.transport,
    required this.type_packet,
    required this.quantity,
    required this.phone_number,
    this.file_document,
  });

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
    city_departure: json['city_departure'],
    city_arrival: json['city_arrival'],
    travel_date: json['travel_date'],
    travel_hour: json['travel_hour'],
    transport: json['transport'],
    type_packet: json['type_packet'],
    quantity: json['quantity'],
    phone_number: json['phone_number'],
  );

  Map<String, dynamic> toJson() => {
    'city_departure': city_departure,
    'city_arrival': city_arrival,
    'travel_date': travel_date,
    'travel_hour': travel_hour,
    'transport': transport,
    'type_packet': type_packet,
    'quantity': quantity,
    'phone_number': phone_number,
  };
}