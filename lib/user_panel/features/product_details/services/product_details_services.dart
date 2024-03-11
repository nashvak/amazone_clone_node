import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../../admin_panel/model/product_model.dart';
import '../../../../common/error_handling.dart';
import '../../../../common/utils.dart';
import '../../../../constants/global_variables.dart';
import '../../../providers/auth/user_provider.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class ProductDetailsServices {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {'id': product.id!, 'rating': rating},
        ),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
