import 'package:ecommerce_app/admin_panel/screens/add_product_screen.dart';
import 'package:ecommerce_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('posts'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        onPressed: () {
          Navigator.pushNamed(context, AddProductScreen.routeName);
        },
        tooltip: 'Add product',
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
