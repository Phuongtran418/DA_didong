import 'package:app_hackbrain/News/News_detail.dart';
import 'package:app_hackbrain/play/menugame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

import 'news_object.dart';
import 'news_provider.dart';

class News extends StatefulWidget {
  @override 
  State<StatefulWidget> createState(){
    return NewsState();
  }
}

class NewsState extends State<News>{
  
  List<MenuObject> lsMenus = [];
  void _LoadDanhSach() async {
    final data = await MenuProvider.getAllMenus();
    setState(() {});
    lsMenus = data;    
  }

  @override
  void initState() {
    super.initState();
    _LoadDanhSach();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
            Text('TIN TỨC',
            style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        actions: [
        IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuGame(),
                    ),
                  );
                },
                icon: Icon(Icons.logout_outlined))
      ]),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
        ),
        child: ListView.builder(
          itemCount: lsMenus.length,
          itemBuilder: (context, index) => InkWell(
        child: Padding(padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Container(
              color: Color.fromARGB(255, 43, 63, 88),
              height: 250,
              child: Column(
                children: [
                  Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  ),
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(lsMenus[index].picture)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.only(left: 5, right: 5),
            child: Center(
          child: Text(lsMenus[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23.0,
            color: Colors.white,
          ))
            ),),
          ],
        ),
              ),
      ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute( builder: (context) => NewsDetail(news: lsMenus[index])));
        },
      )
        )
      ),
    );
  }

}