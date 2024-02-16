import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_app/common/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add_product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController quantityController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            'Add Product',
            // style: TextStyle(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open),
                        Text('Select Product image')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    controller: nameController, hintText: ' Product Name'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: descriptionController,
                  hintText: ' Description',
                  maxLines: 7,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: priceController, hintText: ' Price'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantityController, hintText: ' Quantity'),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: ,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
