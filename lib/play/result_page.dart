import 'package:app_hackbrain/play/play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'field_of_play.dart';

class Result extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ResultState();
  }
}
class ResultState extends State<Result>{
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
 Widget build(BuildContext context) {
  return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 300),
                child: Text("Số câu bạn trả lời đúng: $total_true/${lsAnswer.length} ", style: TextStyle(fontSize: 25),),
              ),
              Container(
                                                    width: 200,
                                                    height: 50,
                                                    child:  TextButton(
                                                      onPressed: () => {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => LinhVuc(),  
                                                          ),
                                                        ).then((value) {
                                                          if(value != null) {
                                                            final snackBar = SnackBar(content: Text(value));
                                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                          }
                                                        })
                                                      },
                                                      child: const Text('Đóng', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
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
        ),
      ));
 }

}