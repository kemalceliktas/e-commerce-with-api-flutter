import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/users_model.dart';
import 'package:store_api_flutter_course/widgets/users_widget.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key, required this.userList});
  final List<UsersModel> userList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All users"),
      ),
      body:ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context,index){
        return ChangeNotifierProvider.value(
          value: userList[index],
          child: UsersWidget());
      }),
    );
  }
}