import 'package:first_app/product_button.dart';
import 'package:flutter/material.dart';
import './products.dart';

class ProductManger extends StatefulWidget {
  final String startingProduct;
  ProductManger({this.startingProduct = 'Sweet Kitten'}) {
    print('[ProductManger widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManger widget] createState');
    return _ProductMangerState();
  }
}

class _ProductMangerState extends State<ProductManger> {
  List<String> _products = [];

  @override
  void initState() {
    print('[ProductManger State] initState');
    _products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(String product) {
    setState(() {
      _products.add('Another Kitten');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManger State] build');
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10),
        child: ProductControl(_addProduct),
      ),
      Products(_products)
    ]);
  }
}
