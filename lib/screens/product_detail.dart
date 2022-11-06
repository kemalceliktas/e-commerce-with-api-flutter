

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class ProductDetails extends StatefulWidget {
  final String title,category,description;
  final List imageUrl;
  final int price;
  
  const ProductDetails({super.key, required this.title, required this.imageUrl, required this.category, required this.description, required this.price});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            const BackButton(),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.start,
                          style: titleStyle,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                              text: "\$",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.price.toString(),
                                  style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight: FontWeight.bold,
                                  )

                                ),
                              ],),
                              
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height *0.4,
                    child: Swiper(
                      itemCount: widget.imageUrl.length,
                      autoplay: true,
                      pagination: SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.white,
                          activeColor: Colors.red,
                        ),
                      ),
                      itemBuilder: (context, index) {
                      return FancyShimmerImage(imageUrl: widget.imageUrl[index],
                      width: double.infinity,
                      boxFit: BoxFit.fill,

                      );
                      
                    },),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",style: titleStyle,),
                      SizedBox(height: 15,),
                      Text(widget.description
                      ,style: TextStyle(fontSize: 22,),
                      textAlign: TextAlign.start,
                      ),
                    ],
                  ),),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
