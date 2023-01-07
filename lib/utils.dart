

import 'package:flutter/material.dart';

class Utils {
  //Logo
  static CircleAvatar logo() {
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      radius: 100,
      child: Image.asset('images/BRAIN.png'),
    );
  }



  static Padding listThemeHackNao(String text, var onClick) {
    return Padding(
      padding:  const EdgeInsets.only(top: 20,left: 5, right: 5),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              height: 100,
              child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                ),
              onPressed: onClick,
             icon: Icon(Icons.bar_chart_outlined, size: 50, color: Colors.black,),
             label: 
             Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                ),
             )
              ),
            ),
          ),
          Expanded(child: Container(height: 56)),
        ],
      ),
    );
  }

  static Padding listThemeWibu(String text, var onClick) {
    return Padding(
      padding:  const EdgeInsets.only(top: 20,left: 5, right: 5),
      child: Row(
        children: [
          Expanded(child: Container(height: 56)),
          Expanded(
            flex: 10,
            child: Container(
              height: 100,
              child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
               primary: Colors.red[300],
                ),
              onPressed: onClick,
          icon: Icon(Icons.android, size: 50, color: Colors.white,),
             label: 
             Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                ),
             )
              ),
            ),
          ),
          Expanded(child: Container(height: 56)),
        ],
      ),
    );
  }

    static Padding listThemeKhoaHoc(String text, var onClick) {
    return Padding(
      padding:  const EdgeInsets.only(top: 20,left: 5, right: 5),
      child: Row(
        children: [
          Expanded(child: Container(height: 56)),
          Expanded(
            flex: 10,
            child: Container(
              height: 100,
              child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                    primary: Colors.purple[300],
                ),
              onPressed: onClick,
             icon: Icon(Icons.app_registration_outlined, size: 50, color: Colors.white,),
             label: 
             Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                ),
             )
              ),
            ),
          ),
          Expanded(child: Container(height: 56)),
        ],
      ),
    );
  }

    static Padding listThemeVatLy(String text, var onClick) {
    return Padding(
      padding:  const EdgeInsets.only(top: 20,left: 5, right: 5),
      child: Row(
        children: [
          Expanded(child: Container(height: 56)),
          Expanded(
            flex: 10,
            child: Container(
              height: 100,
              child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
               primary: Colors.yellow[300],
                ),
              onPressed: onClick,
                  icon: Icon(Icons.redeem_sharp, size: 50, color: Colors.black,),
             label: 
             Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                ),
             )
              ),
            ),
          ),
          Expanded(child: Container(height: 56)),
        ],
      ),
    );
  }
  

    static Padding listThemeLichSu(String text, var onClick) {
    return Padding(
      padding:  const EdgeInsets.only(top: 20,left: 5, right: 5),
      child: Row(
        children: [
          Expanded(child: Container(height: 56)),
          Expanded(
            flex: 10,
            child: Container(
              height: 100,
              child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                primary: Colors.pink[300],
                ),
              onPressed: onClick,
                 icon: Icon(Icons.polyline_outlined, size: 50, color: Colors.black,),
             label: 
             Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                ),
             )
              ),
            ),
          ),
          Expanded(child: Container(height: 56)),
        ],
      ),
    );
  }
}
