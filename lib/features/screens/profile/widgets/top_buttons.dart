import 'package:ecommerce_app/features/screens/profile/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Order',
              onTap: () {},
            ),
            AccountButton(
              text: 'Turn reseller',
              onTap: () {},
            ),
            AccountButton(
              text: 'Logout',
              onTap: () {},
            ),
            AccountButton(
              text: 'Your wishlist',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
