import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/services.dart';

import 'menu_object.dart';


class MenuProvider {
  static Future<List<dynamic>> readJsonData() async {
    var jsonText = await rootBundle.loadString('data/rank.json');
    var data = json.decode(jsonText);
     return data["ranks"];
  }

  static Future<List<MenuObject>> getAllMenus() async {
    List<MenuObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => MenuObject.fromJson(e)).toList();
    return lsResult;
  }

  static Future<List<MenuObject>> searchMenus(String strSearch) async {
    List<MenuObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    data.forEach((element) {
      MenuObject con = MenuObject.fromJson(element);
      if (con.name.toUpperCase().contains(strSearch.toUpperCase()) ||
          con.description.contains(strSearch)) {
        lsResult.add(con);
      }
    });
    return lsResult;
  }
}
