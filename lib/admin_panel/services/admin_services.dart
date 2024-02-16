import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecommerce_app/common/utils.dart';
import 'package:flutter/material.dart';

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
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
