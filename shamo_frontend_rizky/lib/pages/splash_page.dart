// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/provider/product_provider.dart';
import 'package:shamo_frontend_rizky/service/product_service.dart';

import '../utils/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/signPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor1,
        body: Center(
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/icon_splashpage.png'),
            )),
          ),
        ));
  }
}
