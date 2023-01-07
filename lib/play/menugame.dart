import 'package:app_hackbrain/homescreen.dart';
import 'package:app_hackbrain/personal%20details/text_stroke.dart';
import 'package:app_hackbrain/play/field_of_play.dart';
import 'package:app_hackbrain/personal%20details/profile.dart';
import 'package:app_hackbrain/json_rank/rank_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../News/News.dart';
import '../btn/custom_btn.dart';
import '../btn/custom_btn2.dart';
import '../json_friend/list_friend.dart';
import 'load_room_team.dart';
import '../btn/loginScreen.dart';

class MenuGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuGameState();
  }
}

class MenuGameState extends State<MenuGame>{
  String _uid = "";
  String _name = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getdata();
  }
  void getdata() async {
    User user = _auth.currentUser!;
    _uid = user.uid;
    final DocumentSnapshot userdoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    setState(() {
      _name = userdoc.get('Nickname');
    });
    return;
  }
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 22),
            alignment: AlignmentDirectional.topStart,
            child: SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                ),
              onPressed: (){
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                }
              },
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
                child: Image.asset("images/vector.png", fit: BoxFit.cover),
              ),
              TextStroke(
                      content: _name,
                      fontsize: 20,
                      fontfamily: "SVN-DeterminationSans",
                    ),
              ],

              )
            )
            ),
          ),
          Stack(
            children: <Widget>[ 
            Container(
            alignment: AlignmentDirectional.topEnd,
            
          ),]

          ),
          
          
            CustomBtn2(
                text: "Đăng xuất".toUpperCase(),
                paddings: EdgeInsets.all(15),
                ontap: (() async {
                  FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Đăng xuất thành công.')));
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Homescreen())));
                }),
              ),
      Container(
        padding: EdgeInsets.all(10),
        height: 200,
        width: 200,
        child: Image.asset("images/BRAIN.png", fit: BoxFit.cover),
      ),
        Container(
              width: 320,
              padding:  const EdgeInsets.only(left: 15, right: 15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))
          ),
              onPressed: (){
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
                  });
                },
             child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("CHƠI ĐƠN", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white),),
             )
                
              ),
            ),
            Container(
              width: 320,
              padding:  const EdgeInsets.only(top: 10,left: 15, right: 15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))
          ),
              onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => load_room_team(),  
                     ),
                  ).then((value) {
                    if(value != null) {
                      final snackBar = SnackBar(content: Text(value));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
             child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("CHƠI ĐỘI", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white,),),
             )
                
              ),
            ),
            Container(
              width: 320,
              padding:  const EdgeInsets.only(top: 10,left: 15, right: 15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))
          ),
              onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => rank_screen(),  
                     ),
                  ).then((value) {
                    if(value != null) {
                      final snackBar = SnackBar(content: Text(value));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
             child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("BẢNG XẾP HẠNG", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white,),),
             )
                
              ),
            ),
            Container(
              width: 320,
              padding:  const EdgeInsets.only(top: 10,left: 15, right: 15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))
          ),
              onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => friend_screen(),  
                     ),
                  ).then((value) {
                    if(value != null) {
                      final snackBar = SnackBar(content: Text(value));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
             child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("BẠN BÈ", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white,),),
             )
                
              ),
            ),
            Container(
              width: 320,
              padding:  const EdgeInsets.only(top: 10,left: 15, right: 15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))
          ),
              onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => News(),  
                     ),
                  ).then((value) {
                    if(value != null) {
                      final snackBar = SnackBar(content: Text(value));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
             child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("TIN TỨC", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white,),),
             )
                
              ),
            ),
           
      ])
    )

    );
  }

}