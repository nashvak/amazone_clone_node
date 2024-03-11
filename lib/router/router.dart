import 'package:ecommerce_app/admin_panel/model/product_model.dart';
import 'package:ecommerce_app/admin_panel/screens/add_product_screen.dart';
import 'package:ecommerce_app/user_panel/features/product_details/screens/product_details.dart';
import 'package:ecommerce_app/user_panel/features/search/screens/search_screen.dart';
import 'package:ecommerce_app/user_panel/screens/auth/auth_screen.dart';
import 'package:ecommerce_app/common/bottonbar.dart';
import 'package:ecommerce_app/user_panel/screens/home/homescreen.dart';
import 'package:ecommerce_app/user_panel/screens/home/widgets/category_deals.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case CategoryDeals.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDeals(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDeatils.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDeatils(
          product: product,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('oops ..! page not Found...'),
          ),
        ),
      );
  }
}
