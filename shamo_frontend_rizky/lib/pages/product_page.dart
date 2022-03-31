// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/models/product_model.dart';
import 'package:shamo_frontend_rizky/provider/wishlist_provider.dart';

import '../../utils/theme.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel product;
  DetailProduct(this.product);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png'
  ];

  List FamiliarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes1.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
    'assets/image_shoes7.png',
    'assets/image_shoes8.png'
  ];

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    WishListProvider wislistprovider = Provider.of<WishListProvider>(context);

    Future<void> showDialogSucces() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: BackgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: PrimaryTextColor,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icon_success.png',
                  width: 100,
                ),
                SizedBox(height: 12),
                Text(
                  "Hurray :)",
                  style: PrimaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Item added successfully",
                  style: SecondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 154,
                  height: 44,
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/cartPage'),
                    child: Text(
                      "View My Cart",
                      style: PrimaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: currentindex == index ? 16 : 4,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentindex == index ? PrimaryColor : Color(0xffC4C4C4),
          ));
    }

    Widget FamiliarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(imageUrl),
            )),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.chevron_left),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.shopping_bag),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries
                .map((image) => Image.network(
                      image.url,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex = index;
                  });
                }),
          ),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.galleries.map(
                (e) {
                  index++;
                  return indicator(index);
                },
              ).toList())
        ],
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: BackgroundColor1,
        ),
        child: Column(
          children: [
            //todo : Header
            Container(
              padding: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: PrimaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.product.category.name,
                          style: SecondaryTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wislistprovider.setProduct(widget.product);

                      if (wislistprovider.iswishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: SecondaryColor,
                            content: Text(
                              "Has been added to the Wishlist",
                              textAlign: TextAlign.center,
                              style: PrimaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AlertColor,
                            content: Text(
                              "Has been removed from the Wishlist",
                              textAlign: TextAlign.center,
                              style: PrimaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wislistprovider.iswishlist(widget.product)
                          ? 'assets/button_wishlist_active.png'
                          : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),

            //todo : Harga product
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              decoration: BoxDecoration(
                color: BackgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price starts from",
                      style: PrimaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      )),
                  Text("\$${widget.product.price}",
                      style: PriceTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      )),
                ],
              ),
            ),
            // todo : Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: PrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.product.description,
                    style: SubTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            // todo : Familiar Shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Fimiliar Shoes",
                      style: PrimaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: FamiliarShoes.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: FamiliarShoesCard(image));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            // todo : Buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 30,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/DetailChat'),
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          border: Border.all(color: PrimaryColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset('assets/icon_chatt.png'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: PrimaryColor,
                      ),
                      child: TextButton(
                          onPressed: () {
                            showDialogSucces();
                          },
                          child: Text(
                            "Add to Cart",
                            style: PrimaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: BackgroundColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
