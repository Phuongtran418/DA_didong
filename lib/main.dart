import 'package:app_hackbrain/btn/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'btn/loginScreen.dart';
import 'play/menugame.dart';


Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(app_hackbrain());

}

class app_hackbrain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackBrain App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) =>    Homescreen(),  
        'home': (context) => MenuGame(),
      },
    );
  }
}
