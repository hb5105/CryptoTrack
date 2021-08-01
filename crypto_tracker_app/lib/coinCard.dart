import 'package:flutter/material.dart';
class CoinCard extends StatelessWidget {
  CoinCard(
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 1),
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0XFF212936),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 10,
                          spreadRadius: 1),
                    ]),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(imageurl),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   FittedBox(
                     fit: BoxFit.scaleDown,
                     child: Text(
                       name,
                       style: TextStyle(
                         color: Colors.grey[988],
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                    Text(
                      symbol,
                      style: TextStyle(
                        color: Colors.grey[988],
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                   "\$ "+price.toString(),
                    style: TextStyle(
                      color: Colors.grey[988],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                     change<0
                    ? change.toString()
                    : "+"+change.toString(),
                    style: TextStyle(
                      color: change<0?Colors.red :Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    changepercentage<0
                    ? changepercentage.toString() + "%"
                    : "+"+changepercentage.toString()+'%',
                    style: TextStyle(
                      color: changepercentage<0?Colors.red :Colors.green,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
