// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo_frontend_rizky/widgets/arrival_products.dart';
import 'package:shamo_frontend_rizky/widgets/products_card.dart';

import '../../utils/theme.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        right: defaultMargin,
        left: defaultMargin,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hallo, Alex",
                  style: PrimaryTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                ),
                Text(
                  "@alexkeinn",
                  style:
                      SubTextStyle.copyWith(fontSize: 16, fontWeight: regular),
                )
              ],
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/profile_default.png'),
                )),
          )
        ],
      ),
    );
  }

  Widget Categories() {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: PrimaryColor,
              ),
              child: Text(
                "All Shoes",
                style:
                    PrimaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: SubtitleColor,
                ),
              ),
              child: Text(
                "Running",
                style:
                    PrimaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: SubtitleColor),
              ),
              child: Text(
                "Training",
                style:
                    PrimaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: SubtitleColor),
              ),
              child: Text(
                "Basketball",
                style:
                    PrimaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: SubtitleColor),
              ),
              child: Text(
                "Hiking",
                style:
                    PrimaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PopularProductsTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        right: defaultMargin,
        left: defaultMargin,
      ),
      child: Text(
        "Popular Products",
        style: PrimaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
      ),
    );
  }

  Widget PopularProducts() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            Row(
              children: [
                ProductsCard(),
                ProductsCard(),
                ProductsCard(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget NewArrivalTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        right: defaultMargin,
        left: defaultMargin,
      ),
      child: Text(
        "New Arrival",
        style: PrimaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
      ),
    );
  }

  Widget NewArrivals() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Column(
        children: [
          ArrivalProducts(),
          ArrivalProducts(),
          ArrivalProducts(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        Categories(),
        PopularProductsTitle(),
        PopularProducts(),
        NewArrivalTitle(),
        NewArrivals(),
      ],
    );
  }
}
