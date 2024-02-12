import 'package:ecommerce_app/screens/profile/widgets/orders.dart';
import 'package:ecommerce_app/screens/profile/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar.dart';
import 'widgets/below_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ProfileScreenAppbar(),
      ),
      body: Column(
        children: [
          BelowAppbar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
          SizedBox(
            height: 20,
          ),
          YourOrders(),
        ],
      ),
    );
  }
}
