

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TabFirst extends StatelessWidget{
  @override
  Widget _History(String type, String KQ, String TiSo)
  {
    return Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Color.fromARGB(255, 255, 227, 125)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(children: [
                    Text('Loại: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                    Text(type, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
                  ]),
                ),
                Container(
                  child: Text(KQ, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                ),
                Container(
                  child: Row(
                    children: [
                      Text('Tỉ Số: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                      Text(TiSo, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
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
          );
  } 
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _History('Đấu đội', 'Chiến Thắng', '15/13',),
          _History('Đấu đội', 'Thất Bại', '11/13'),
          _History('Chơi đơn', 'Hoàn Thành', '30/30'),
          _History('Đấu đội', 'Chiến Thắng', '15/13'),
          _History('Đấu đội', 'Thất Bại', '11/13'),
          _History('Chơi đơn', 'Hoàn Thành', '30/30'),
          _History('Đấu đội', 'Chiến Thắng', '15/13'),
          _History('Đấu đội', 'Thất Bại', '11/13'),
          _History('Chơi đơn', 'Hoàn Thành', '30/30'),
          _History('Đấu đội', 'Chiến Thắng', '15/13'),
          _History('Đấu đội', 'Thất Bại', '11/13'),
          _History('Chơi đơn', 'Hoàn Thành', '30/30'),
          
        ],
      ),
    );
  }

}