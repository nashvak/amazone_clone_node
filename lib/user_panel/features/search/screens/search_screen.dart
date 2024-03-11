import 'package:ecommerce_app/admin_panel/screens/widgets/loader.dart';
import 'package:ecommerce_app/user_panel/features/search/services/search_services.dart';
import 'package:ecommerce_app/user_panel/screens/home/widgets/address_box.dart';
import 'package:flutter/material.dart';
import '../../../../admin_panel/model/product_model.dart';
import '../../../screens/home/widgets/homescreen_appbar.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchServices searchServices = SearchServices();
  List<Product>? products;
  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomescreenAppbar(),
      ),
      body: products == null
          ? const Loader()
          : Column(
              children: [
                const AddressBox(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          return const Row(
                            children: [],
                          );
                        }))
              ],
            ),
    );
  }
}
