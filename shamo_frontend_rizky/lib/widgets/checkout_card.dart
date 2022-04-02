import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/models/cart_model.dart';
import 'package:shamo_frontend_rizky/provider/cart_provider.dart';
import '../../utils/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
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
                  overflow: TextOverflow.ellipsis,
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
          Text(
            "${cart.quantity} Items",
            style: SecondaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
          )
        ],
      ),
    );
  }
}
