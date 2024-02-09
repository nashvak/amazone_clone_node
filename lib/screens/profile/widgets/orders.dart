import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import 'single_product.dart';

class YourOrders extends StatefulWidget {
  const YourOrders({super.key});

  @override
  State<YourOrders> createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  List<String> imageList = [
    'https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/Apple-iPhone-15-Pro/Blue-Titanium/Apple-iPhone-15-Pro-Blue-Titanium-thumbnail.png',
    'https://i.gadgets360cdn.com/products/large/Oppo-Reno-10-Pro-Plus-5G-DB-709x800-1685018454.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ],
          ),
        ),
        // display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   OrderDetailScreen.routeName,
                  //   arguments: orders![index],
                  // );
                },
                child: SingleProduct(
                  image: imageList[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
