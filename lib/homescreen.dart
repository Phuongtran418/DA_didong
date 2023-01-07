import 'package:app_hackbrain/btn/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'btn/loginScreen.dart';


class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
        height: 300,
        width: 300,
        child: Image.asset("images/BRAIN.png", fit: BoxFit.cover),
      ),
      Container(
      child: Text('ĐĂNG NHẬP', style: TextStyle(color: Colors.yellow[400], fontSize: 50, fontWeight: FontWeight.bold)),
        ),
        Container(
        
              width: double.infinity,
              padding:  const EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                primary: Colors.blue[400],
                ),
              onPressed: (){},
             icon: Icon(Icons.facebook, size: 50, color: Colors.white,),
             label: 
             Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("FACEBOOK", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white),),
             )
                
              ),
            ),
            Container(
        
              width: double.infinity,
              padding:  const EdgeInsets.only(top: 10,left: 15, right: 15),
              child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                primary: Colors.red[400],
                ),
              onPressed: (){},
             icon: Icon(Icons.email, size: 50, color: Colors.white,),
             label: 
             Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("GOOGLE", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white,),),
             )
                
              ),
            ),
            Container(
        
              width: double.infinity,
              padding:  const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                ),
              onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),  
                     ),
                  ).then((value) {
                    if(value != null) {
                      final snackBar = SnackBar(content: Text(value));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
            child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text("ĐĂNG NHẬP BẰNG TÀI KHOẢN", style: TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: Colors.white),),
             )
                
              ),
            ),
            Container(
              width: double.infinity,
              padding:  const EdgeInsets.only(top: 10,left: 15, right: 15),
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                primary: Colors.green[500],
                ),
              onPressed: (){
                },
             child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("CHƠI GAME", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.white),),
             )
                
              ),
            ),
            
            Stack(
              children: [
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                     child:  Text('Nếu bạn chưa có tài khoản? Hãy đăng ký!', style:Theme.of(context).textTheme.headline6?.copyWith(
                      foreground: Paint()
                  ..style = PaintingStyle.stroke
                  .. color = Colors.white
                  .. strokeWidth = 1
              )),
                  )
              ],
             
            ),
            Container(
              padding:  const EdgeInsets.all(15),
              alignment: AlignmentDirectional.bottomEnd,
              child: OutlinedButton(
              style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
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
                  padding: EdgeInsets.all(10),
                  child: const Text('Đăng ký!', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                
              ),
            ),
      ])
    )

    );
  }

}