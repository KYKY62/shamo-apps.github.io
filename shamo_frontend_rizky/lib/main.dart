// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shamo_frontend_rizky/pages/cart_page.dart';
import 'package:shamo_frontend_rizky/pages/checkout_page.dart';
import 'package:shamo_frontend_rizky/pages/checkout_succes.dart';
import 'package:shamo_frontend_rizky/pages/detail_chat_page.dart';
import 'package:shamo_frontend_rizky/pages/edit_profile_page.dart';
import 'package:shamo_frontend_rizky/provider/auth_provider.dart';
import 'package:shamo_frontend_rizky/provider/cart_provider.dart';
import 'package:shamo_frontend_rizky/provider/page_provider.dart';
import 'package:shamo_frontend_rizky/provider/product_provider.dart';
import 'package:shamo_frontend_rizky/provider/transaction_provider.dart';
import 'package:shamo_frontend_rizky/provider/wishlist_provider.dart';

import './pages/signin_page.dart';
import './pages/splash_page.dart';
import './pages/signup_page.dart';
import './pages/home/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => authProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/signPage': (context) => SigninPage(),
          '/signupPage': (context) => SignUpPage(),
          '/mainPage': (context) => MainPage(),
          '/editProfile': (context) => EditProfile(),
          '/cartPage': (context) => CartPage(),
          '/checkout': (context) => CheckOutPage(),
          '/checkoutSucces': (context) => CheckoutSucces(),
        },
      ),
    );
  }
}
