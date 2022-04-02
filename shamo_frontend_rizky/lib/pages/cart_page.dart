// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/provider/cart_provider.dart';
import 'package:shamo_frontend_rizky/widgets/cart_card.dart';
import '../../utils/theme.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);

    Widget contentEmpty() {
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
              "Opss! Your Cart is Empty",
              style: PrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Let's find your favorite shoes",
              style: SecondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 152,
              height: 44,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                    backgroundColor: PrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text(
                  "Explore Store",
                  style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        children: cartprovider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
      );
    }

    Widget CustomNavBar() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: PrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    "\$${cartprovider.totalPrice()}",
                    style: PriceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(
              thickness: 0.3,
              color: SubtitleColor,
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/checkout'),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: PrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Continue to Checkout",
                      style: PrimaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: PrimaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: BackgroundColor3,
      appBar: AppBar(
        backgroundColor: BackgroundColor3,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: PrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      body: cartprovider.carts.length == 0 ? contentEmpty() : content(),
      bottomNavigationBar:
          cartprovider.carts.length == 0 ? SizedBox() : CustomNavBar(),
    );
  }
}
