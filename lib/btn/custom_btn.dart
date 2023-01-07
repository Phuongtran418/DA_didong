import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  const CustomBtn(
      {Key? key,
      this.ontap,
      this.text = "",
      this.paddings = const EdgeInsets.all(10)})
      : super(key: key);

  final VoidCallback? ontap;
  final String text;
  final EdgeInsets paddings;

  @override
  _CustomBtnState createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
         child: Container(
             child: Container(
         child: Stack(
          children: [
             Padding(padding: EdgeInsets.only(top: 30),
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
               decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:  BorderRadius.circular(10),
                ),
                child: Text(widget.text,
                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
            ),
             )
          ],
         ),
      ),
      ),
    );
  }
}
