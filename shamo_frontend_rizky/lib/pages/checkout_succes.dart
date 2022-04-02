// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class CheckoutSucces extends StatelessWidget {
  const CheckoutSucces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image_empty.png',
              width: 80,
            ),
            SizedBox(height: 20),
            Text(
              "You made a transaction",
              style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Stay at home while we\nprepare your dream shoes",
              style: SecondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Container(
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/mainPage', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: PrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Order Other Shoes",
                  style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            Container(
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff39374B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "View My Order",
                  style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: Color(0xffB7B6BF),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: BackgroundColor3,
      appBar: AppBar(
        backgroundColor: BackgroundColor3,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Checkout Success",
          style: PrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      body: content(),
    );
  }
}
