// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/models/product_model.dart';
import 'package:shamo_frontend_rizky/provider/wishlist_provider.dart';

import '../../utils/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistprovider = Provider.of<WishListProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(
        top: 10,
        bottom: 14,
        left: 12,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: BackgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries[0].url,
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: PrimaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "\$${product.price}",
                  style: PriceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => wishlistprovider.setProduct(product),
            child: Image.asset('assets/button_wishlist_active.png', width: 34),
          )
        ],
      ),
    );
  }
}
