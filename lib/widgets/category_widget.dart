import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Category categoryProvicer = Provider.of<Category>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FancyShimmerImage(
              imageUrl: categoryProvicer.image!,
              height: size.width * 0.45,
              errorWidget: Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              width: size.width * 0.45,
              boxFit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            
            child: Align(
              alignment: Alignment.center,
              child: Text(categoryProvicer.name.toString(),textAlign: TextAlign.center,
              style: TextStyle(backgroundColor: lightCardColor.withOpacity(0.7),fontSize: 16,fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}
