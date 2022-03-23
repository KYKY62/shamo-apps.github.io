// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_frontend_rizky/widgets/checkout_card.dart';
import '../../utils/theme.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          //todo List item
          SizedBox(height: 30),
          Text(
            "List Items",
            style: PrimaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 12),
          CheckoutCard(),
          CheckoutCard(),
          // todo Addres Detail
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: BackgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store_loc.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/line_1.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_ur_address.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Location",
                          style: SecondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          "Adidas Core",
                          style: PrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Your Address",
                          style: SecondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          "Marsemoon",
                          style: PrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          // todo Payment Summary
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: BackgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Summary",
                  style: PrimaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Quantity",
                            style: SecondaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            "Product Price",
                            style: SecondaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            "Shipping",
                            style: SecondaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2 Items",
                          style: PrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "\$575.96",
                          style: PrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Free",
                          style: PrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 11),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Total",
                        style: PriceTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                    Text(
                      "\$575.92",
                      style: PriceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: defaultMargin),
                Divider(
                  thickness: 1,
                  color: Color(0xff2B2938),
                ),
                SizedBox(height: defaultMargin),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/checkoutSucces", (route) => false);
                    },
                    child: Text(
                      "Checkout Now",
                      style: PrimaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: BackgroundColor3,
      appBar: AppBar(
        backgroundColor: BackgroundColor3,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout Details",
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
