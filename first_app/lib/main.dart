import 'package:flutter/material.dart';
import './product_manger.dart';
import './app_drawer.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: ProductManger(startingProduct: 'Kitten Kitten'),
        drawer: AddDrawer(),
      ),
    );
  }
}
