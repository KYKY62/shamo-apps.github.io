// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset(
            'assets/image_shoes.png',
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
                  "Hiking",
                  style: SecondaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                ),
                SizedBox(height: 6),
                Text(
                  "COURT VISION 2.0 ",
                  style: TextStyle(
                    color: Color(0xff2E2E2E),
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6),
                Text(
                  "\$58,67",
                  style:
                      PriceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
