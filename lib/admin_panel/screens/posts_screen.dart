import 'package:ecommerce_app/admin_panel/model/product_model.dart';
import 'package:ecommerce_app/admin_panel/screens/add_product_screen.dart';
import 'package:ecommerce_app/admin_panel/screens/widgets/loader.dart';
import 'package:ecommerce_app/admin_panel/services/admin_services.dart';
import 'package:ecommerce_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  fetchAllProducts() async {
    await adminServices.fetchAllProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
