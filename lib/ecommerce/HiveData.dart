// import 'dart:js';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/ecommerce/cubit/cubit/sales_cubit.dart';
import 'package:ecommerce/ecommerce/model/salesModel.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

//  final cubit = context.read<SalesCubit>();

class HiveHelper {
  static String BoxName = "BoxName";
  static String BoxNameKey = "BoxNameKey";

  static List<Map<String, dynamic>> Sales = [];
  static var box = Hive.box(BoxName);

  static void addItem(Map<String, dynamic> map) async {
    Sales.add(map);
    // dynamic sale = int.parse(Sales[index]["price"].toString());
    // print(sale);
    // sale = sale * count;
    // Sales.add(sale);
    // Sales[index]["price"].toString() = sale.toString();
    // print(Sales[index]["price"].toString());
    // print(Sales[index]["price"].toString() + "testtttttttttttttttttttttt");
    // salesData.fromJson({img: img, index: index, price: price});
    // print(Sales);
    await box.put(BoxNameKey, Sales);
    // print(box.values.toString() + "    ollllllllllllll");
  }

  static num total = 0;

  static num? totalPrice() {
    for (var i = 0; i < Sales.length; i++) {
      total = total + (Sales[i]["price"]);
      print(Sales.toString() + "kkkkkkkkkkkkkkkkkkkk");
      print(total.toString() + "totalllllllllllllllllllllll");
    }

    return total;

    // await box.put(BoxNameKey, Sales);
  }

  static void GetItem() async {
    if (box.isNotEmpty) {
      Sales = box.get(BoxNameKey);
    }
  }

  static void removeItem(int index) async {
    Sales.removeAt(index);
    await box.put(BoxNameKey, Sales);
  }

  static void removeAll() async {
    Sales.clear();
    await box.put(BoxNameKey, Sales);
  }

  // static void updateNotes(int index, String text) async {
  //   Sales[index] = text;
  //   await box.put(BoxNameKey, Sales);
  // }
}
