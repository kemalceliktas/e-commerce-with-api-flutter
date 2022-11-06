import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

import '../models/category_model.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categoryList});
  final List<Category> categoryList;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: categoryList[index],
              child: CategoryWidget());
          },
        ),
      ),
    );
  }
}