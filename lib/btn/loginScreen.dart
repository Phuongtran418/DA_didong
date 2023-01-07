import 'dart:developer';
import 'package:app_hackbrain/btn/login.dart';
import 'package:app_hackbrain/btn/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_btn.dart';
import 'custom_input_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
   Services services = Services();
   TextEditingController txtEmail = TextEditingController();
    TextEditingController txtPass = TextEditingController();
    final _auth = FirebaseAuth.instance;
     final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
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
  padding: EdgeInsets.all(10),
  height: 120,
  width: 120,
  child: Image.asset("images/BRAIN.png", fit: BoxFit.cover),
),
Container(
child: Text('ĐĂNG NHẬP TÀI KHOẢN', style: TextStyle(color: Colors.yellow[400], fontSize: 30, fontWeight: FontWeight.bold)),
),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomInputForm(
                      controllers: txtEmail,
                      label: "Email",
                    
                      typeKeyboard: TextInputType.emailAddress,
                    ),
                    CustomInputForm(
                      controllers: txtPass,
                      label: "Password",
                      textSecure: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập đầy đủ';
                        }
                        return null;
                      },
                    ),
                    CustomBtn(
                      text: "Đăng Nhập".toUpperCase(),
                      ontap: () {
                        if (txtEmail.text.isNotEmpty &&
                            txtPass.text.isNotEmpty) {
                          services.loginUser(
                              txtEmail.text, txtPass.text, context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Vui lòng nhập cho đầy đủ"),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
   
             Container(
              padding:  const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(192, 75, 243, 33),),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterState(),  
                     ),
                  ).then((value) {
                    if(value != null) {
                      final snackBar = SnackBar(content: Text(value));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: const Text('ĐĂNG KÝ', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                
              ),
            ),
            Container(
              padding:  const EdgeInsets.all(5),
              child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
          ),
          onPressed: () {},
          child: Text(
            "Quên mật khẩu?",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
            ),
]),
    )
    );
  }
}