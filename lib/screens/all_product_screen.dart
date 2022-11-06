import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import '../widgets/appbar_icons.dart';
import '../widgets/feeds_widget.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key, required this.productList});
  final List<ProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: const Text("All product"),
         
        ),
      body: GridView.builder(
        
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: productList[index],
            child: FeedsWidget());
        },
      ),
    );
  }
}
