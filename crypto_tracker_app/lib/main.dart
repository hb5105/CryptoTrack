import 'dart:async';
import 'dart:convert';

import 'package:crypto_tracker_app/mycoin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coinCard.dart' show CoinCard;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  {

  Future<List<Coin>> fetchCoin()async{

    coinlist=[];
    final response =await http.get(Uri.parse("http://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page1&sparkline=false"));

    if(response.statusCode==200){
      List<dynamic> values =[];
      values=json.decode(response.body);
      if(values.length>0)
      {
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic>map =values[i];
            coinlist.add(Coin.fromJson(map));

          }
        }
        print(coinlist.first.name);
        setState(() {
        coinlist;
      });
      }
      
      return coinlist;
    }//if
    else{
      throw Exception("Failed to load the coins");
    }
    
  }

   @override
  void initState() {
    fetchCoin(); 
    Timer.periodic(Duration(seconds: 10),(timer)=>fetchCoin());
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color(0XFF212936),
        centerTitle: true,
        title: Text(
          "CryptoTrack",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(scrollDirection: Axis.vertical,
      itemCount: coinlist.length,
      itemBuilder: (context,index){
        return CoinCard(name: coinlist[index].name, symbol: coinlist[index].symbol, imageurl: coinlist[index].imageurl, price: coinlist[index].price, change: coinlist[index].change, changepercentage: coinlist[index].changepercentage);
      },)
    );
  }
}
