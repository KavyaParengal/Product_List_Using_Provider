
import 'package:flutter/material.dart';
import 'package:product_list/product.dart';
import 'package:product_list/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Provider_Class(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Product_List(),
    ),
  ));
}


