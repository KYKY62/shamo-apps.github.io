// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_frontend_rizky/models/product_model.dart';
import 'package:shamo_frontend_rizky/pages/product_page.dart';

import '../../utils/theme.dart';

class ProductsCard extends StatelessWidget {
  final ProductModel product;

  ProductsCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailProduct(product),
        ),
      ),
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultMargin),
            Image.network(
              product.galleries[0].url,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: SecondaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Color(0xff2E2E2E),
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    "\$${product.price}",
                    style: PriceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
