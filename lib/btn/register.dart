
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_btn.dart';
import 'custom_input_form.dart';



class RegisterState extends StatelessWidget{
  RegisterState({Key? key}) : super(key: key);
  TextEditingController nickname = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtPass2 = TextEditingController();
  final _user = FirebaseAuth.instance.currentUser;
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
  height: 150,
  width: 150,
  child: Image.asset("images/BRAIN.png", fit: BoxFit.cover),
),
Container(
child: Text('ĐĂNG KÝ TÀI KHOẢN', style: TextStyle(color: Colors.yellow[400], fontSize: 30, fontWeight: FontWeight.bold)),
),
                   Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomInputForm(
                          controllers: nickname,
                          label: "Tên người dùng",
                        ),
                        CustomInputForm(
                          controllers: txtEmail,
                          label: "Email",
                          typeKeyboard: TextInputType.emailAddress,
                        ),
                        CustomInputForm(
                          controllers: txtPass,
                          label: "Mật khẩu",
                          textSecure: true,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập đầy đủ';
                            }
                            return null;
                          },
                        ),
                        CustomInputForm(
                          controllers: txtPass2,
                          label: "Xác nhận mật khẩu",
                          textSecure: true,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập đầy đủ';
                            }
                            return null;
                          },
                        ),
                        
                        CustomBtn(
                          text: "Đăng ký ngay".toUpperCase(),
                          ontap: () async {
                            if(txtEmail.text.isEmpty ||
                            txtPass.text.isEmpty ||
                            nickname.text.isEmpty ||
                            txtPass2.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Vui lòng nhập đầy đủ thông tin'),
                                  ),
                              );
                            } else if(txtPass.text != txtPass2.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Vui lòng nhập trùng password'),
                                  ),
                              );
                            }else if (txtPass.text.length > 0 &&
                              txtPass.text.length < 8){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Vui lòng nhập mật khẩu 8 kí tự!'),
                                    ),);
                              }else{
                              try {
                                UserCredential NewUser = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: txtEmail.text,
                                        password: txtPass.text);
                                User? user = NewUser.user;
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user?.uid)
                                    .set({
                                  "Coin": 0,
                                  "Diamond": 0,
                                  "Email": txtEmail.text,
                                  "Energy": 100,
                                  "Nickname": nickname.text,
                                  "PassWord": txtPass.text,
                                  "CreateDate": DateTime.now(),
                                });
                                if (NewUser != null) {
                                  Navigator.pop(context, "Thành công");
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Tài khoản này không hợp lệ"),
                                    ),
                                  );
                                }
                              } catch (e) {
                              final snackBar =
                                  SnackBar(content: Text('Có lỗi xảy ra!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            }
                          },
                        ),
                      ],
                    ),
                  ),           
]),
    )
    );
  }
}