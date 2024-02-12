import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class ProfileScreenAppbar extends StatelessWidget {
  const ProfileScreenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'images/amazon_in.png',
              width: 120,
              height: 45,
              color: Colors.black,
            ),
          ),
          Container(
            // color: Colors.red,
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.notifications_outlined),
                ),
                Icon(
                  Icons.search,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
