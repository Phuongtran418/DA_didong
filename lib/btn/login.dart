
import 'package:app_hackbrain/play/menugame.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Services {
  final auth = FirebaseAuth.instance;
  loginUser(email, password, context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuGame()));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email hoặc mật khẩu không chính xác!"),
        ),
      );
    }
  }
}
