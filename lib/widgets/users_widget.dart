import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersModel userProvider = Provider.of<UsersModel>(context);
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        
        imageUrl: userProvider.avatar.toString(),
        height: size.width * 0.15,
        errorWidget: Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        width: size.width * 0.15,
        boxFit: BoxFit.fill,
      ),
      title: Text(userProvider.name.toString()),
      subtitle: Text(userProvider.email.toString()),
      trailing: Text(
        userProvider.role.toString(),
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
