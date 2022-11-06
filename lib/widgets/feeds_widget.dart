import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/screens/product_detail.dart';

class FeedsWidget extends StatelessWidget {

  
  const FeedsWidget({super.key,});


  @override
  Widget build(BuildContext context) {
    final ProductModel productModelProvider = Provider.of<ProductModel>(context);
    
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(2),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(title: productModelProvider.title.toString(),imageUrl: productModelProvider.images!,description: productModelProvider.description.toString(),price: productModelProvider.price!,category: productModelProvider.category!.name.toString(),),),);
            },
            borderRadius: BorderRadius.circular(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: "\$",
                            style: TextStyle(
                              color: Color.fromRGBO(33, 150, 243, 1),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${productModelProvider.price}.00",
                                  style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Icon(IconlyBold.heart),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: productModelProvider.images![0],
                    height: size.height * 0.2,
                    
                    errorWidget: Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                    width: double.infinity,
                    boxFit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    productModelProvider.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: size.height*0.01,),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
