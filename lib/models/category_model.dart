import 'package:flutter/material.dart';

class Category with ChangeNotifier{
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

    static List<Category> productsFromJson(List categorySnapshot) {
   
    return categorySnapshot.map((data) {
   
      return Category.fromJson(data);
    }).toList();
  }


}