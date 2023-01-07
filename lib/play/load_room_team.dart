import 'package:app_hackbrain/play/play_your_team.dart';
import 'package:flutter/material.dart';

import 'menugame.dart';

class load_room_team extends StatefulWidget {
  @override 
  State<StatefulWidget> createState() {
    return load_room_teamState();
  }
}
class load_room_teamState extends State<load_room_team> {
  Widget tv(String name)
  => Container(
                  height: 20,
                  width: double.infinity,
                  //color: Colors.white,
                  child: Row(
                    children: [
                      Text(name, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                    ],
                  )
                );
  Widget img(String picture)
  => Container(
                  height: 20,
                  width: double.infinity,                 
                  child: Row(
                    children: [
                      Image.asset(picture, fit: BoxFit.cover)
                    ],
                  )
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 394,
            height: 780,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover) 
                      ),
                    ),
                  ],
                ),
                 Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 60),
                          child: TextButton(
                            child: Text('Phòng ID: 345125',
                            style: TextStyle(fontSize: 20,
                                  color: Colors.white,     
                                  ),
                            ),
                            onPressed: () {},
                                  style: ButtonStyle(                                
                                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(102, 142, 3, 255)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                        ),
                                        side: BorderSide(color: Color.fromARGB(64, 142, 3, 255)),
                                      )
                                    ),                                          
                                  ),
                          ),
                        ),
                        Container(  
                          padding: EdgeInsets.only(top: 65),                   
                            child: SizedBox(
                              width: 150,
                              height: 50,
                               child: TextButton(                                                       
                                child: Text('Rời phòng',                         
                                style: TextStyle(fontSize: 20,
                                color: Colors.white,     
                                fontWeight: FontWeight.bold
                                ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuGame(),  
                                    ),
                                  ).then((value) {
                                    if(value != null) {
                                      final snackBar = SnackBar(content: Text(value));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                  });
                                },
                                style: ButtonStyle(                                                                  
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.white,
                                      width: 3,
                                      ),                                                                          
                                    ),
                                  ),                                 
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                 ),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 120),
                            width: 80,
                            child: Image.asset('images/BRAIN.png', fit: BoxFit.cover), 
                          ),
                          Container(   
                           child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 120, left: 115),
                                 child: Text('CHẾ ĐỘ: 4/4',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 17, 50, 197),
                                    fontWeight: FontWeight.bold
                                  ),
                            ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 150, left: 40),
                                 child: Text('MỨC CƯỢC: 1000 XU',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 17, 50, 197),
                                    fontWeight: FontWeight.bold
                                  ),
                            ),
                              ),
                            ],
                           ),                                         
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        child: Padding(padding: const EdgeInsets.only(top: 210),
                        child: Container(  
                          child: Stack(
                           children: [
                            Container(
                              height: 240,
                              width: double.infinity,
                              color: Color.fromARGB(102, 142, 3, 255),
                              child: ListView(
                                padding: EdgeInsets.only(top: 30),
                                    children: <Widget>[
                                      Container(                          
                                        height: 50,                             
                                        decoration: ShapeDecoration(  
                                          color: Color.fromARGB(102, 3, 142, 255),                    
                                          shape: RoundedRectangleBorder (
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                          ),                       
                                        ),
                                        child: Stack(                               
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(left: 50),
                                              child: img('images/anh_hao652.png'),
                                              width: 110,
                                              height: 110,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 150),
                                              alignment: Alignment.centerLeft,
                                              child: tv('anh_hao652',),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(left: 290),
                                              alignment: Alignment.centerLeft,
                                              child: img('images/CUP.png'),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 320),
                                              alignment: Alignment.centerLeft,
                                              child: tv('1805'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,                             
                                        height: 50,                             
                                        decoration: ShapeDecoration(   
                                          color: Color.fromARGB(102, 3, 142, 255),                    
                                          shape: RoundedRectangleBorder (
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                          ),                       
                                        ),
                                        child: Stack(                               
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(left: 50),
                                              child: img('images/VI-TEA.png'),
                                              width: 110,
                                              height: 110,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 150),
                                              alignment: Alignment.centerLeft,
                                              child: tv('VI-TEA'),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(left: 290),
                                              alignment: Alignment.centerLeft,
                                              child: img('images/CUP.png'),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 320),
                                              alignment: Alignment.centerLeft,
                                              child: tv('576'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,                             
                                        height: 50,                             
                                        decoration: ShapeDecoration(   
                                          color: Color.fromARGB(102, 3, 142, 255),                    
                                          shape: RoundedRectangleBorder (
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                          ),                       
                                        ),
                                        child: Stack(                               
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(left: 50),
                                              child: img('images/MrBinz.png'),
                                              width: 110,
                                              height: 110,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 150),
                                              alignment: Alignment.centerLeft,
                                              child: tv('MrBinz'),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(left: 290),
                                              alignment: Alignment.centerLeft,
                                              child: img('images/CUP.png'),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 320),
                                              alignment: Alignment.centerLeft,
                                              child: tv('7102'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,                             
                                        height: 50,                             
                                        decoration: ShapeDecoration(   
                                          color: Color.fromARGB(102, 3, 142, 255),                    
                                          shape: RoundedRectangleBorder (
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                          ),                       
                                        ),
                                        child: Stack(                               
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(left: 50),
                                              child: img('images/Uyên_Duy.png'),
                                              width: 150,
                                              height: 150,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 150),
                                              alignment: Alignment.centerLeft,
                                              child: tv('Uyên_Duy'),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(left: 290),
                                              alignment: Alignment.centerLeft,
                                              child: img('images/CUP.png'),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 320),
                                              alignment: Alignment.centerLeft,
                                              child: tv('87'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.only(top: 3),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text('Team 1', 
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        ),
                            ),
                           ], 
                          ),
                          
                        ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 465, left: 95),
                            child: SizedBox(
                              width: 200,
                              height: 50,
                               child: TextButton(                                                       
                                child: Text('SẮN SÀNG',                         
                                style: TextStyle(fontSize: 20,
                                color: Colors.white,     
                                ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => play_your_team(),  
                                    ),
                                  ).then((value) {
                                    if(value != null) {
                                      final snackBar = SnackBar(content: Text(value));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                  });
                                },
                                style: ButtonStyle(                                                                  
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.white,
                                      width: 3,
                                      ),                                                                          
                                    ),
                                  ),                                 
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                  Stack(
                    children: [
                      Container(
                        child: Padding(padding: const EdgeInsets.only(top: 530),
                        child: Container(  
                          child: Stack(
                           children: [
                            Container(
                              height: 240,
                              width: double.infinity,
                              color: Color.fromARGB(102, 142, 3, 255),
                              child: ListView(
                                padding: EdgeInsets.only(top: 30),
                                    children: <Widget>[
                                      Container(
                              alignment: AlignmentDirectional.centerStart,                             
                              height: 50,                             
                              decoration: ShapeDecoration(   
                                color: Color.fromARGB(197, 255, 3, 100),                    
                                shape: RoundedRectangleBorder (
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),                       
                              ),
                              child: Stack(                               
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: img('images/_KaLong_.png'),
                                    width: 110,
                                    height: 110,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 150),
                                    alignment: Alignment.centerLeft,
                                    child: tv('_KaLong_'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 290),
                                    alignment: Alignment.centerLeft,
                                    child: img('images/CUP.png'),
                                  ),
                                   Container(
                                    padding: EdgeInsets.only(left: 320),
                                    alignment: Alignment.centerLeft,
                                    child: tv('1783'),
                                  ),
                                ],
                              ), 
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,                             
                              height: 50,                             
                              decoration: ShapeDecoration(   
                                color: Color.fromARGB(197, 255, 3, 100),                    
                                shape: RoundedRectangleBorder (
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),                       
                              ),
                              child: Stack(                               
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: img('images/Duy_Khôi.png'),
                                    width: 120,
                                    height: 120,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 150),
                                    alignment: Alignment.centerLeft,
                                    child: tv('Duy_Khôi'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 290),
                                    alignment: Alignment.centerLeft,
                                    child: img('images/CUP.png'),
                                  ),
                                   Container(
                                    padding: EdgeInsets.only(left: 320),
                                    alignment: Alignment.centerLeft,
                                    child: tv('15657'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,                             
                              height: 50,                             
                              decoration: ShapeDecoration(   
                                color: Color.fromARGB(197, 255, 3, 100),                    
                                shape: RoundedRectangleBorder (
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),                       
                              ),
                              child: Stack(                               
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: img('images/Yến_652.png'),
                                    width: 110,
                                    height: 110,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 150),
                                    alignment: Alignment.centerLeft,
                                    child: tv('Yến_652'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 290),
                                    alignment: Alignment.centerLeft,
                                    child: img('images/CUP.png'),
                                  ),
                                   Container(
                                    padding: EdgeInsets.only(left: 320),
                                    alignment: Alignment.centerLeft,
                                    child: tv('198'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,                             
                              height: 50,                             
                              decoration: ShapeDecoration(   
                                color: Color.fromARGB(197, 255, 3, 100),                    
                                shape: RoundedRectangleBorder (
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),                       
                              ),
                              child: Stack(                               
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: img('images/Bụng_Bự.png'),
                                    width: 110,
                                    height: 110,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 150),
                                    alignment: Alignment.centerLeft,
                                    child: tv('Bụng_Bự'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 290),
                                    alignment: Alignment.centerLeft,
                                    child: img('images/CUP.png'),
                                  ),
                                   Container(
                                    padding: EdgeInsets.only(left: 320),
                                    alignment: Alignment.centerLeft,
                                    child: tv('908'),
                                  ),
                                ],
                              ),
                            ),
                                    ],
                                  ),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.only(top: 3),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text('Team 2', 
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        ),
                            ),
                           ], 
                          ),
                          
                        ),
                        ),
                      ),
                    ],
                  ),
              ],
            ), 
          ),  
        ],
      ),
    );
  }
}