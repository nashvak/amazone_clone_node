import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/global_variables.dart';
import '../../../providers/auth/user_provider.dart';

class BelowAppbar extends StatelessWidget {
  const BelowAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: RichText(
          text: TextSpan(
            text: 'Hello, ',
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: user.name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ));
  }
}
