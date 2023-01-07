import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

import 'menu_detail.dart';
import 'menu_object.dart';
import 'menu_provider.dart';


class rank_screen extends StatefulWidget {
  @override 
  State<StatefulWidget> createState(){
    return rank_screenState();
  }
}
class rank_screenState extends State<rank_screen> {
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
      body: Column(
        children: [
          Container(
            width: 394,
            height: 780,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover) 
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 70),
                      alignment: Alignment.topCenter,
                        child: Text( 'BẢNG XẾP HẠNG',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25, 
                            fontWeight: FontWeight.bold,            
                      ),
                        ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only( top: 130),
                      child: Container( 
                        width: 400,
                        height: 650,
                        child: ContainedTabBarView(
                            tabs: [ 
                                Text('Top xu',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                                ),
                                Text('Top câu hỏi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                                ),
                            ],
                            tabBarProperties: TabBarProperties(
                              width: 300,
                              height: 40,
                              background: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: Offset(1, -1),
                                    ),
                                  ],
                                ),
                              ),
                              position: TabBarPosition.top,
                              alignment: TabBarAlignment.center,
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey[400],
                            ),
                            views: [
                              Container(
                                child: Stack(
                                  children: [
                                    Container(
                                        child: ListView.builder(
                                          itemCount: lsMenus.length,
                                          itemBuilder: (context, index) => Card(
                                                child: ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(lsMenus[index].picture),
                                                  ),
                                                  title: Text(lsMenus[index].name),
                                                  subtitle: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(lsMenus[index].rank),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => MenuDetail(menu: lsMenus[index]),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                 child: Stack(
                                  children: [
                                    Container(
                                        child: ListView.builder(
                                          itemCount: lsMenus.length,
                                          itemBuilder: (context, index) => Card(
                                                child: ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(lsMenus[index].picture),
                                                  ),
                                                  title: Text(lsMenus[index].name),
                                                  subtitle: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(lsMenus[index].rank),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => MenuDetail(menu: lsMenus[index]),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
