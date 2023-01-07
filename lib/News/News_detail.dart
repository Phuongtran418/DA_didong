import 'package:app_hackbrain/play/menugame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

import 'news_object.dart';
import 'news_provider.dart';

class NewsDetail extends StatefulWidget {
  MenuObject news;
  NewsDetail({Key? key, required this.news}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return NewsDetailState();
  }
}

class NewsDetailState extends State<NewsDetail> {
  //Khởi tạo
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtNote = TextEditingController();
  TextEditingController txtImage = TextEditingController();

  @override
  void initState() {
    super.initState();
    //Khởi tạo
    txtTitle.text = this.widget.news.title;
    txtDescription.text = this.widget.news.description;
    txtNote.text = this.widget.news.note;
    txtImage.text = this.widget.news.picture;
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
            Text(this.widget.news.title,
            style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      body: Container(
        padding: EdgeInsets.only(right: 5, left: 5),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Center(
              child: Text(this.widget.news.title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(this.widget.news.picture),
            SizedBox(
              height: 10,
            ),
            Text('MÔ TẢ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text(this.widget.news.description,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 10,
            ),
            Text('LƯU Ý', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(this.widget.news.note,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ],
        ),
      )
    );
  }

}