

import 'package:flutter/material.dart';

class play_your_team extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget _box (String text)
    { return Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
    );}
    Widget _menber(String point, String men)
    {
      return Container(
              height: 140,
              width: 140,
              child: Column(
                children: [
                Padding(padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color.fromARGB(255, 0, 255, 221),
                  child: Center(child: Text(men)),
                ),
                ),
                  Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                  Text('Điểm: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(point, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  Icon(Icons.star_border_purple500, color: Colors.white, size: 18,)
                  ]
                  )
                ],
              ),
            );
    }
     
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
        ),
        child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
            width: 90,
            height: 90,
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 255, 239, 254),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.orange,
                width: 3,
              )
            ),
            child: Center(child: Text('15s', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)),
      ),
      Container(
            height: 60,
            width: 150,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 177, 64, 117),
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: Text('Lĩnh Vực: Hỏi Troll', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
          ),
          Container(
            height: 80,
            width: 150,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 177, 64, 117),
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: Text('Số điểm hiện tại: 130 điểm', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
          ),
          ],
        ),
        ),
          Text('THÀNH VIÊN ĐỘI', style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        FittedBox(fit: BoxFit.fitWidth,child:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _menber('140', 'Thành viên 1'),
            _menber('120' , 'Thành viên 2'),
            _menber('220' , 'Thành viên 3'),
            _menber('320' , 'Thành viên 4'),
          ],
        ),),
      
          FittedBox(fit: BoxFit.fitWidth,child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _box('1'),
              _box('2'),
              _box('3'),
              _box('3'),
              _box('4'),
              _box('5'),
              _box('6'),
              _box('7'),
              _box('8'),
              _box('9'),
              _box('10'),
            ],
          ),),
          Container(
            width: double.infinity,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children:<Widget>[
                Positioned(
                  right: 20,
                  bottom: 6,
              child: Container(
              height: 110,
              width: 370,
              decoration: BoxDecoration(
              color: Color.fromARGB(255, 122, 131, 255),
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('Hoa gì biết ăn biết ngủ?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),)),

          ),
                ),
                Positioned(
                  left: 8,
                  top: 25,
                  child: Container(
            width: 70,
            height: 70,
            decoration: new BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Center(child: Text('Câu 1: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),)),
      ),
                )

              ],
            ),
          ),
        
        Padding(padding: EdgeInsets.only(bottom: 15),
        child: Container(
          padding: EdgeInsets.only(left: 90, right: 20, ),
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: (){},
             child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3)
                  ),
                  child: Center(child: Text('A', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                ),
                Container(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Hoa bịp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                )
              ],
             ),
        )
        ), 
        ),
        
        Padding(padding: EdgeInsets.only(bottom: 15),
        child: Container(
          padding: EdgeInsets.only(left: 90, right: 20, ),
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: (){},
             child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3)
                  ),
                  child: Center(child: Text('B', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                ),
                Container(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Hoa hậu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                )
              ],
             ),
        )
        ), 
        ),
        Padding(padding: EdgeInsets.only(bottom: 15),
        child: Container(
          padding: EdgeInsets.only(left: 90, right: 20, ),
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: (){},
             child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3)
                  ),
                  child: Center(child: Text('C', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                ),
                Container(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Hoa mơ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                )
              ],
             ),
        )
        ), 
        ),
        Padding(padding: EdgeInsets.only(bottom: 15),
        child: Container(
          padding: EdgeInsets.only(left: 90, right: 20, ),
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: (){},
             child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3)
                  ),
                  child: Center(child: Text('D', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                ),
                Container(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Hoa lài', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                )
              ],
             ),
        )
        ), 
        ),
         Container(
                  child: OutlinedButton(
                style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))
          ),
              onPressed: (){},
             child: Container(
              width: 200,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Center(child: Text("Đầu Hàng", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 0, 0)),),
                )
             )
              ),
         )
         ],
            )
      ),
    );
  }}