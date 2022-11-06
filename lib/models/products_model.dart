import 'dart:ffi';

import 'package:flutter/material.dart';

import 'category_model.dart';

class ProductModel with ChangeNotifier{
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});
/* j(product['price'] as num).toDouble()*/
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num).toInt();
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    images = json['images'].cast<String>();
  }

  static List<ProductModel> productsFromJson(List productSnapshot) {
   
    return productSnapshot.map((data) {
  
      return ProductModel.fromJson(data);
    }).toList();
  }
}
