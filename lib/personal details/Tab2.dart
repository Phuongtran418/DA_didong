import 'package:app_hackbrain/personal%20details/text_stroke.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../btn/custom_btn.dart';




class TabSecond extends StatefulWidget {
  const TabSecond(
      {Key? key,
      this.nickname = "",
      this.created_at = "",
      this.hightest_score = "",
      this.game_played = ""})
      : super(key: key);

  final String nickname;
  final String created_at;
  final String hightest_score;
  final String game_played;

  @override
  _TabSecondState createState() => _TabSecondState();
}

class _TabSecondState extends State<TabSecond> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _user = FirebaseAuth.instance.currentUser;
  String _uid = "";
  String _name = "";
  String _email = "";
  Timestamp stamp = Timestamp.now();
  final _now = DateFormat.yMMMMd().format(DateTime.now()).toString();

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
      _email = userdoc.get('Email');
    });
    print("name nay ban ${_now}");
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
          ),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextStroke(
                      content: "Nickname:",
                      fontsize: 20,
                      strokesize: 2,
                    ),
                    TextStroke(
                      content: _name,
                      fontsize: 20,
                      fontfamily: "SVN-DeterminationSans",
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStroke(
                      content: "Email:",
                      fontsize: 20,
                      strokesize: 2,
                    ),
                    TextStroke(
                      content: _email,
                      fontsize: 20,
                      fontfamily: "SVN-DeterminationSans",
                    ),
                  ],
                ),
              ),        
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStroke(
                      content: "Ngày tạo:",
                      fontsize: 20,
                      strokesize: 2,
                    ),
                    TextStroke(
                      content: _now,
                      fontsize: 20,
                      fontfamily: "SVN-DeterminationSans",
                    ),
                  ],
                ),
              ),     
              
            ],
          ),
        ),
      ),
    );
  }
}
