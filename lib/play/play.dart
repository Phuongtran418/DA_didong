// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:app_hackbrain/btn/custom_time_play.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:app_hackbrain/play/menugame.dart';
import 'package:quiver/async.dart';
import 'field_of_play.dart';

int total_true = 0;
class Play extends StatefulWidget {
  const Play({Key? key, required this.theme}) : super(key: key);
  final String theme;
  @override
  PlayState createState() {
    return PlayState();

  }
}

class PlayState extends State<Play> {
  late CollectionReference chude =
      FirebaseFirestore.instance.collection(widget.theme);
    @override
  
    
 
  List lsResult = ["dapan1", "dapan2", "dapan3", "dapandung"];
  List lsAnswer = [
    "cau-01",
    "cau-02",
    "cau-03",
    "cau-04",
    "cau-05",
    "cau-06",
    "cau-07",
    "cau-08",
    "cau-09",
    "cau-10",
  ];
 
  int idAnswer = 0;
  var color_origin = const Color(0xFFB4B291);
  var color_50 = Color.fromARGB(0, 180, 178, 145);
  var color_black = const Color(0xFF000000);

  int total = 0;
  int total_next = 0;
  

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
    int random1 = Random().nextInt(lsResult.length);
    int random2 = Random().nextInt(lsResult.length);
    int random3 = Random().nextInt(lsResult.length);
    int random4 = Random().nextInt(lsResult.length);
    while (random2 == random1 || random2 == random3 || random2 == random4) {
      random2 = Random().nextInt(lsResult.length);
    }
    while (random3 == random1 || random3 == random2 || random3 == random4) {
      random3 = Random().nextInt(lsResult.length);
    }
    while (random4 == random1 || random4 == random2 || random4 == random3) {
      random4 = Random().nextInt(lsResult.length);
    }
    
    bool trogiup_50 = true;
    int i = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          //color: const Color(0xFFE9F8FF),
          alignment: Alignment.center,
          child: FutureBuilder<DocumentSnapshot>(
            future: chude.doc(lsAnswer[idAnswer]).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [ 
                           Padding(padding: EdgeInsets.only(top:10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Customtime(),
                          //       Container(
                          //        child: Row(
                                  
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //            Text(
                          //             ((current / 60).toInt()).toString(),
                          //             style: TextStyle(fontSize: 20),
                          //           ),
                          //           Text(
                          //             ':',
                          //             style: TextStyle(fontSize: 20),
                          //           ),
                          //           Text(
                          //             ((current % 60).toInt()).toString(),
                          //             style: TextStyle(fontSize: 20),
                          //           )
                          //         ],
                          //        ),
                          //       width: 100,
                          //       height: 100,
                          //       decoration: new BoxDecoration(
                          //         color: Color.fromARGB(255, 5, 5, 5),
                          //         shape: BoxShape.circle,
                          //         border: Border.all(
                          //           color: Colors.orange,
                          //           width: 3,
                          //         )
                          //       ),         
                          // ),
                          
                          Container(
                            width: 120,
                            height: 50,
                            child : OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 3),
                                backgroundColor:  Color.fromARGB(255, 177, 64, 117),
                              ),
                              onPressed: () {
                                  total_next++;
                                  if (idAnswer < lsAnswer.length - 1) {
                                    idAnswer = idAnswer + 1;
                                  }
                                  setState(() {
                                    if (total + total_next == lsAnswer.length) {
                                      result_answer(context);
                                    }
                                  });
                                }, 
                              child: Text('Đổi câu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            child : OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 3),
                                backgroundColor:  Color.fromARGB(255, 177, 64, 117),
                              ),
                              onPressed: () {}, 
                              child: Text('Gợi ý', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          )
                              ],
                            ),
                            ),
                            Padding(padding: EdgeInsets.all(3),
                              child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 177, 64, 117),
                                border: Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text('Còn lại 3 lượt', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                            ),
                          ),
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
                          Padding(padding: EdgeInsets.only(top: 10),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.white, width: 4),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                              width: double.infinity,
                              height: 100,
                              padding:  const EdgeInsets.only(left: 15, right: 5, top:20),
                              child:Text(data['cauhoi'],),  
                              
                            ),
                            
                          ),
                          // Text(
                          //   '${idAnswer + 1}/${lsAnswer.length}',
                          //   style: const TextStyle(fontSize: 20),
                          // ),
                          //Đáp án A
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 370,
                                    height: 70,
                                    decoration: BoxDecoration(
                                       color: Color.fromARGB(255, 122, 131, 255),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random1 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random1]],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10, left: 10),
                                    child:  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3)
                                    ),
                                    child: Center(child: Text('A', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Đáp án B
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 370,
                                    height: 70,
                                    decoration: BoxDecoration(
                                       color: Color.fromARGB(255, 122, 131, 255),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random2 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random2]],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10, left: 10),
                                    child:  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3)
                                    ),
                                    child: Center(child: Text('B', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Đáp án C
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 370,
                                    height: 70,
                                    decoration: BoxDecoration(
                                       color: Color.fromARGB(255, 122, 131, 255),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random3 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random3]],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10, left: 10),
                                    child:  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3)
                                    ),
                                    child: Center(child: Text('C', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Đáp án D
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 370,
                                    height: 70,
                                    decoration: BoxDecoration(
                                       color: Color.fromARGB(255, 122, 131, 255),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random4 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random4]],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10, left: 10),
                                    child:  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3)
                                    ),
                                    child: Center(child: Text('D', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children:  <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  total_next++;
                                  if (idAnswer < lsAnswer.length - 1) {
                                    idAnswer = idAnswer + 1;
                                  }
                                  setState(() {
                                    if (total + total_next == lsAnswer.length) {
                                      result_answer(context);
                                    }
                                  });
                                },
                                style: ButtonStyle(                                
                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(0, 28, 3, 255)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white, width: 3),
                                )
                                  ),                                          
                                    ),
                                child: const Text(
                                  'Skip câu hỏi',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                          Container(   
                          child: SizedBox(
                            width: 200,
                            height: 50, 
                            child: TextButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Kết quả', style: TextStyle(color: Colors.red,
                                  fontWeight: FontWeight.bold, fontSize: 25
                                  ),
                                  ),
                                  titlePadding: EdgeInsetsDirectional.only(start: 120, top: 5),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Số câu bạn trả lời đúng: $total_true/${lsAnswer.length}"),
                                      ),
                                      Container(
                                        width:  500,
                                        height: 500,
                                        child: Stack(
                                          children: [
                                            Stack(
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                      width: 500,
                                                      height: 200,  
                                                      decoration: ShapeDecoration(   
                                                        color: Color.fromARGB(117, 108, 111, 112),                    
                                                        shape: RoundedRectangleBorder (
                                                          borderRadius: BorderRadius.circular(20),
                                                          side: BorderSide(
                                                            width: 2,
                                                            color: Color.fromARGB(117, 108, 111, 112),
                                                          ),
                                                        ),                       
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                        Container(
                                                          padding: EdgeInsets.only(left: 90),
                                                            child: Text('Xếp hạng', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                                                            ,fontSize: 20),),
                                                          ),
                                                          FittedBox(fit: BoxFit.fitWidth,child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Container(
                                                                      padding: EdgeInsets.only( top: 50),
                                                                      child: Text('-500',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                                                                    ,fontSize: 20)),
                                                                    ),
                                                                Container(
                                                                      width: 80,
                                                                      height: 80,
                                                                      padding: EdgeInsets.only( top: 45),
                                                                      child: Image.asset('images/CUP.png'), 
                                                                    ),
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 50),
                                                                      child: Text('Hiện tại: 7364',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                                                                      ,fontSize: 20)),
                                                                    ),
                                                                    Container(
                                                                      width: 80,
                                                                      height: 80,
                                                                      padding: EdgeInsets.only( top: 45),
                                                                      child: Image.asset('images/CUP.png'), 
                                                                  
                                                                    ),
                                                          ],
                                                        ),),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 500,
                                                      height: 200,  
                                                      decoration: ShapeDecoration(   
                                                        color: Color.fromARGB(117, 108, 111, 112),                    
                                                        shape: RoundedRectangleBorder (
                                                          borderRadius: BorderRadius.circular(20),
                                                          side: BorderSide(
                                                            width: 2,
                                                            color: Color.fromARGB(117, 108, 111, 112),
                                                          ),
                                                        ),                       
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                        Container(
                                                          padding: EdgeInsets.only(left: 70),
                                                            child: Text('Phần thưởng', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                                                            ,fontSize: 20),),
                                                          ),
                                                          FittedBox(fit: BoxFit.fitWidth,child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                              Container(
                                                                      padding: EdgeInsets.only( top: 50),
                                                                      child: Text('X0', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                                                                      ,fontSize: 20)),
                                                                    ),
                                                                Container(
                                                                      width: 80,
                                                                      height: 80,
                                                                      padding: EdgeInsets.only( left: 20, top: 45),
                                                                      child: Image.asset('images/VANG.png'), 
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.only(left: 50, top: 50),
                                                                      child: Text('X0', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                                                                      ,fontSize: 20)),
                                                                    ),
                                                                    Container(
                                                                      width: 80,
                                                                      height: 80,
                                                                      padding: EdgeInsets.only(left: 30,top: 45),
                                                                      child: Image.asset('images/Tim.png'), 
                                                                    ),
                                                          ],
                                                        ),),
                                                        ],
                                                      ),
                                                    ),
                                                      ],
                                                    ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [    
                                    Container(
                                      width: 500,
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Stack(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    width: 200,
                                                    height: 50,
                                                    child:  TextButton(
                                                      onPressed: () => {
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
                                                        })
                                                      },
                                                      child: const Text('Nhận', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                                      fontSize: 20),),
                                                      style: ButtonStyle( 
                                                        backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(234, 48, 47, 47),),                                                                 
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                        side: BorderSide(color: Colors.black,
                                                        width: 2,
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
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              style: ButtonStyle(                                
                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(0, 28, 3, 255)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 3),
                                )
                                  ),                                          
                                    ),
                              child: const Text('Dừng', style: TextStyle(color: Colors.red,
                              fontWeight: FontWeight.bold, fontSize: 20
                              ),
                              ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const Text("Loanding...");
            },
          ),
        ),
      ),
    );
  }


  Future<void> right_answer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/Right.png',
              ),
              const SizedBox(height: 20),
              const Text(
                "Bạn đã trả lời đúng!",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () {
                if (idAnswer < lsAnswer.length - 1) {
                  idAnswer = idAnswer + 1;
                }
                setState(() {
                  Navigator.of(context).pop();
                  if (total + total_next == lsAnswer.length) {
                    result_answer(context);
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> wrong_answer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/Wrong.png',
              ),
              const SizedBox(height: 20),
              const Text(
                "Bạn đã trả lời sai!",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                if (idAnswer < lsAnswer.length - 1) {
                  idAnswer = idAnswer + 1;
                }

                setState(() {
                  Navigator.of(context).pop();
                  if (total + total_next == lsAnswer.length) {
                    result_answer(context);
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> result_answer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kết quả:'),
          content:
              Text("Số câu bạn trả lời đúng: $total_true/${lsAnswer.length}"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LinhVuc(),
                      ));
                });
              },
            ),
          ],
        );
      },
    );
  }
}
