import 'package:flutter/material.dart';

class CustomBtn2 extends StatefulWidget {
  const CustomBtn2(
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

class _CustomBtnState extends State<CustomBtn2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
         child: Container(
             child: Container(
         child: Stack(
          children: [
             Padding(padding: EdgeInsets.only(top: 10, right: 120),
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 50,
               decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white),
                    left: BorderSide(color: Colors.white),
                    right: BorderSide(color: Colors.white),
                    bottom: BorderSide(color: Colors.white),
                  ),
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
