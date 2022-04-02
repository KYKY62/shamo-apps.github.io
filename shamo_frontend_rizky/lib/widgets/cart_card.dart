// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/models/cart_model.dart';
import 'package:shamo_frontend_rizky/provider/cart_provider.dart';
import '../../utils/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;

  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      height: 120,
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: BackgroundColor4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  cart.product.galleries[0].url,
                  width: 60,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product.name,
                      style: PrimaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "\$${cart.product.price}",
                      style: PriceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartprovider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/button_tambah.png',
                      width: 16,
                    ),
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: PrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      cartprovider.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/button_min.png',
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: (() => cartprovider.removeCart(cart.id)),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_remove.png',
                  width: 10,
                ),
                SizedBox(width: 4),
                Text(
                  "Remove",
                  style: AlertTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
