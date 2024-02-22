import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecommerce_app/common/error_handling.dart';
import 'package:ecommerce_app/common/utils.dart';
import 'package:ecommerce_app/providers/auth/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../constants/global_variables.dart';
import '../model/product_model.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      var cloudinary = CloudinaryPublic('ddr04sraj', 'p5mkxzee');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        //download url get from cloudinary
        imageUrls.add(response.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);
      http.Response response = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: product.toJson(),
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackbar(context, 'product added succesfully');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
