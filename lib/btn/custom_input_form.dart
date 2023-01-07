import 'package:flutter/material.dart';

typedef String? StringCallBack(String? arg);

class CustomInputForm extends StatelessWidget {
  const CustomInputForm(
      {Key? key,
      this.controllers,
      this.label = '',
      this.hint = '',
      this.textSecure = false,
      this.typeKeyboard = TextInputType.text,
      this.validate})
      : super(key: key);

  final String label;
  final String hint;
  final bool textSecure;
  final TextInputType typeKeyboard;
  final StringCallBack? validate;
  final TextEditingController? controllers;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Container(
            padding:
                EdgeInsets.only(left: 50, right: 50, top: 10),
            child: SizedBox(
              child: Container(
                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:  BorderRadius.circular(10),
                ),
                child: TextFormField(
                controller: controllers,
                validator: validate,
                obscureText: textSecure,
                keyboardType: typeKeyboard,
                decoration: InputDecoration(
                  hintText: hint,
                  labelText: label,
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
              ),
            )),
      ]),
    );
  }
}
