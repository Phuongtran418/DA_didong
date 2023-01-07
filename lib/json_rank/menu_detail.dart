import 'package:flutter/material.dart';

import 'menu_object.dart';

class MenuDetail extends StatefulWidget {
  MenuObject menu;
  MenuDetail({Key? key, required this.menu}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MenuDetailState();
  }
}

class MenuDetailState extends State<MenuDetail> {
  //Khởi tạo
  TextEditingController txtName = TextEditingController();
  TextEditingController txtRank = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  @override
  void initState() {
    super.initState();
    //Khởi tạo
    txtName.text = this.widget.menu.name;
    txtDescription.text = this.widget.menu.description;
    txtRank.text = this.widget.menu.rank;
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Chi tiết"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              //lấy hình ảnh
              this.widget.menu.picture,
              width: 200,
              height: 100,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 54, 164, 254),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        this.widget.menu.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 100),
                      ),
                      Text(
                        '${this.widget.menu.rank} ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: Text(
                      this.widget.menu.description,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  )
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
