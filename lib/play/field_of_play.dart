import 'package:app_hackbrain/play/menugame.dart';
import 'package:app_hackbrain/play/play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class LinhVuc extends StatefulWidget {
  const LinhVuc({super.key});

  @override
  State<StatefulWidget> createState() {
    return LinhVucState();
  }
}

class LinhVucState extends  State<LinhVuc>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Lĩnh vực'), 
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
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/backgroud.jpg"), fit: BoxFit.cover)
        ),
        child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          mainAxisExtent: 120,
        ),
        children: [
            Utils.listThemeHackNao("Hack Não", play_HackNao),
            Utils.listThemeWibu("Wibu", play_Wibu),
            Utils.listThemeKhoaHoc("Khoa Học", play_KhoaHoc),
            Utils.listThemeVatLy("Vật Lý", play_VatLy),
            Utils.listThemeLichSu("Lịch Sử", play_LichSu),
        ],
        
      )),
      
      );
    }

    String theme = '';

  void play_HackNao() {
    setState(() {
      theme = 'goihacknao';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_Wibu() {
    setState(() {
      theme = 'goiwibu';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_KhoaHoc() {
    setState(() {
      theme = 'goikhoahoc';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_VatLy() {
    setState(() {
      theme = 'goivatly';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_LichSu() {
    setState(() {
      theme = 'goilichsu';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }
  }