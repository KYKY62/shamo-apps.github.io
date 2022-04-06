// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/provider/page_provider.dart';
import 'package:shamo_frontend_rizky/provider/wishlist_provider.dart';
import 'package:shamo_frontend_rizky/widgets/wishlist_card.dart';

import '../../utils/theme.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistprovider = Provider.of<WishListProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget Header() {
      return AppBar(
        backgroundColor: BackgroundColor4,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
          style: PrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget WishEmpty() {
      return Expanded(
        child: Container(
          color: BackgroundColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/love_icon.png',
                width: 74,
              ),
              SizedBox(height: 23),
              Text(
                " You don't have dream shoes? ",
                style: PrimaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                "Let's find your favorite shoes",
                style: SubTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 152,
                height: 44,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
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
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: BackgroundColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: wishlistprovider.wishlist
              .map(
                (product) => WishlistCard(product),
              )
              .toList(),
        ),
      ));
    }

    return Column(
      children: [
        Header(),
        // WishEmpty(),
        wishlistprovider.wishlist.length == 0 ? WishEmpty() : content(),
      ],
    );
  }
}
