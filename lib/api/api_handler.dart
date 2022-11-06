import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_const.dart';
import 'package:store_api_flutter_course/models/category_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class ApiHandle {

  static Future<List<ProductModel>> getAllProduct()async{
    //https://api.escuelajs.co/api/v1/products
  var uri = Uri.https(BASE_URL,"api/v1/products",);
    var response=await http.get(uri);
    
    var data = jsonDecode(response.body);
    List tempList = [];
    for (var items in data) {
      tempList.add(items);
    }
    return ProductModel.productsFromJson(tempList);
  }


  static Future<List<Category>> getAllCategory()async{
    //https://api.escuelajs.co/api/v1/categories
  var uri = Uri.https(BASE_URL,"api/v1/categories",);
    var response=await http.get(uri);
    
    var data = jsonDecode(response.body);
    List tempList = [];
    for (var items in data) {
      tempList.add(items);
    }
    return Category.productsFromJson(tempList);
  }
  /* https://api.escuelajs.co/api/v1/products?offset=0&limit=1 */

  static Future<List<UsersModel>> getAllUsers()async{
    //https://api.escuelajs.co/api/v1/users
  var uri = Uri.https(BASE_URL,"api/v1/users",);
    var response=await http.get(uri);
    
    var data = jsonDecode(response.body);
    List tempList = [];
    for (var items in data) {
      tempList.add(items);
    }
    return UsersModel.productsFromJson(tempList);
  }


  static Future<List<ProductModel>> getSearch({required String target,String? limit})async{
    
    //https://api.escuelajs.co/api/v1/users
  var uri = Uri.https(BASE_URL,"api/v1/$target",target == "products" ?{
    "offset":"0",
    "limit":limit,
  }:{"offset":"0","limit":"10"});
    var response=await http.get(uri);
    
    var data = jsonDecode(response.body);
    List tempList = [];
    for (var items in data) {
      tempList.add(items);
    }
    return ProductModel.productsFromJson(tempList);
  }

}