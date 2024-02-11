import 'package:ecommerce_app/screens/home/widgets/address_box.dart';
import 'package:ecommerce_app/screens/home/widgets/top_catagories.dart';
import 'package:flutter/material.dart';

import 'widgets/homescreen_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: HomescreenAppbar(),
        ),
        body: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategories(),
          ],
        ));
  }
}
