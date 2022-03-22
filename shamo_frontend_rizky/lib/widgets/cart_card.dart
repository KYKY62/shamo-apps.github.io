// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      height: 110,
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
                child: Image.asset(
                  'assets/image_shoes.png',
                  width: 60,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terrex Urban Low",
                      style: PrimaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "\$143,98",
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
                    onTap: () {},
                    child: Image.asset(
                      'assets/button_tambah.png',
                      width: 16,
                    ),
                  ),
                  Text(
                    "2",
                    style: PrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {},
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
          Row(
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
          )
        ],
      ),
    );
  }
}
