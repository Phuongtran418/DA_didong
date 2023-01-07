import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

import 'friend_detail.dart';
import 'friend_object.dart';
import 'friend_provider.dart';




class friend_screen extends StatefulWidget {
  @override 
  State<StatefulWidget> createState(){
    return friend_screenState();
  }
}
class friend_screenState extends State<friend_screen> {
  List<MenuObject> lsFriends = [];
  void _LoadDanhSach() async {
    final data = await MenuProvider.getAllMenus();
    setState(() {});
    lsFriends = data;    
  }

  @override
  void initState() {
    super.initState();
    _LoadDanhSach();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Bạn bè"),
      ),
      body: Column(
        children: [
          Container(
            width: 394,
            height: 660,
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
                                        child: ListView.builder(
                                          itemCount: lsFriends.length,
                                          itemBuilder: (context, index) => Card(
                                                child: ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(lsFriends[index].picture),
                                                  ),
                                                  title: Text(lsFriends[index].name),
                                                  subtitle: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(lsFriends[index].rank),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => MenuDetail(menu: lsFriends[index]),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )),
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
