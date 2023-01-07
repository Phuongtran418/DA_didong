import 'package:quiver/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../play/result_page.dart';

class Customtime extends StatefulWidget {
  const Customtime({Key? key, this.thoigian =15}) : super(key: key);
  final int thoigian;
  @override
  CustomState createState() {
    return CustomState();
  }
}

class CustomState extends State<Customtime> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }
    @override
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
    return InkWell(
        child: Container(
          child: Padding(padding: EdgeInsets.only(top:10),
            child: Row(
              children: [
              Container(
                                 child: Row(
                                  
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      ((current / 60).toInt()).toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      ':',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      ((current % 60).toInt()).toString(),
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                 ),
                                width: 100,
                                height: 100,
                                decoration: new BoxDecoration(
                                  color: Color.fromARGB(255, 5, 5, 5),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 3,
                                  )
                                ),         
                          ),
              ],
            ),
          ),
        ),
      
    );
  }
   late int starttime = widget.thoigian;
    late int current = widget.thoigian;
  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: starttime),
      new Duration(seconds: 1),
    );
 
    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if(mounted){
        setState(() {
        current =   starttime - duration.elapsed.inSeconds;
        //current = starttime - duration.elapsed.inSeconds;
      });
      }
      else{
        sub.cancel();
        
      }
    });
    sub.onDone(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
              )
              
              ))//viết thành 1 cái giao diện mới z thôii
              
              ); 
    });
  }

  
  
}