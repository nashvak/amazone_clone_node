import 'dart:convert';

import 'package:ecommerce_app/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, json.decode(response.body)['msg']);
      break;
    case 500:
      showSnackbar(context, json.decode(response.body)['error']);
      break;
    default:
      showSnackbar(context, response.body);
  }
}
