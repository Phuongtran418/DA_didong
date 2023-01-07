import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Tabthird  extends StatelessWidget{
  @override
  Widget _Store(String name, String price)
  {
    return Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              border: Border.merge(
          new Border(top: BorderSide(color: Colors.red, width: 3)),
          new Border(bottom: BorderSide(color: Colors.green, width: 3))),
          color: Color.fromARGB(255, 121, 255, 150)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(children: [
                    Text(name, style: TextStyle(color: Colors.black),)
                  ]),
                ),
                Container(
                  child: Row(
                    children: [
                      Text('Số tiền: ', style: TextStyle(color: Colors.black)),
                      Text(price, style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
                Container(
              padding:  const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(192, 33, 117, 243),),
                ),
                onPressed: (){},
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: const Text('Xem chi tiết', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                
              ),
            ),
              ],
            ),
          )
    ;
  } 
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _Store('Gói năng cấp', '23.000VND'),
          _Store('Gói năng cấp', '100.000VND'),
          _Store('Gói năng cấp', '5000.000VND'),
          _Store('Gói năng cấp', '5.000VND'),
          _Store('Gói năng cấp', '78.000VND'),
          _Store('Gói năng cấp', '11.000VND'),
          _Store('Gói năng cấp', '35.000VND'),
          _Store('Gói năng cấp', '40.000VND'),
          _Store('Gói năng cấp', '200.000VND'),
          _Store('Gói năng cấp', '12.000VND'),
          _Store('Gói năng cấp', '23.000VND'),
          _Store('Gói năng cấp', '23.000VND'),
          _Store('Gói năng cấp', '23.000VND'),
          _Store('Gói năng cấp', '23.000VND'),
        ],
      ),
    );
  }

}