import 'package:flutter/material.dart';

class Coin {
  Coin(
      {required this.name,
      required this.symbol,
      required this.imageurl,
      required this.price,
      required this.change,
      required this.changepercentage});

  String name;
  String symbol;
  String imageurl;
  num price;
  num change;
  num changepercentage;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        name: json['name'],
        symbol: json['symbol'],
        imageurl: json['image'],
        price: json['current_price'],
        change: json['price_change_24h'],
        changepercentage: json['price_change_percentage_24h']);
  }
}
List<Coin> coinlist=[];