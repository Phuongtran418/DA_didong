import 'package:app_hackbrain/play/menugame.dart';
import 'package:app_hackbrain/personal%20details/text_stroke.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tab1.dart';
import 'Tab2.dart';
import 'Tab3.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile>{
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
    return DefaultTabController(length: 3, 
    child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
        ),
      child: Column(children: [
        
        Container(
          padding: EdgeInsets.only(top:30),
          child: Column(
            children: [
             Container(
                width: 90,
                child: Image.asset("images/vector.png"),
              ),
              TextStroke(
                      content: _name,
                      fontsize: 20,
                      fontfamily: "SVN-DeterminationSans",
                    ),
            ],
          )
        ),
        TabBar(
          tabs: [
            Tab(
              text: "Lịch Sử Đấu",
              icon: Icon(Icons.ac_unit),
            ),
            Tab(
              text: "Thông Tin Cá Nhân",
              icon: Icon(Icons.search,
             ),
            ),
            Tab(
              text: "Mua Hàng",
              icon: Icon(Icons.store),
            ),
          ] ),
          Expanded(
          child: TabBarView(
            children:[
              TabFirst(),
              TabSecond(),
              Tabthird(),
            ]
              ),
             ),
              Container(
              padding:  const EdgeInsets.all(5),
              width: 300,
              child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
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
          child: Text(
            "Quay lại",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
            ),
      ]),
    )
    )
    );
    }
  }
