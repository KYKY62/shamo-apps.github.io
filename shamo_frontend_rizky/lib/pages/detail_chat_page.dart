// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_frontend_rizky/widgets/chat_bubble.dart';

import '../utils/theme.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget ProductPreview() {
      return Container(
          width: 225,
          height: 74,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: BackgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: PrimaryColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/image_shoes.png',
                  width: 54,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "COURT VISIO...",
                      style: PrimaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "\$57,15",
                      style: PriceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/button_x.png",
                width: 22,
              )
            ],
          ));
    }

    Widget ChatInput() {
      return Container(
        padding: MediaQuery.of(context).viewInsets,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: BackgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: TextFormField(
                      style: PrimaryTextStyle,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration.collapsed(
                        hintText: "Typle Message...",
                        hintStyle: SubTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                    )),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/button_send.png",
                    width: 45,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            isSender: true,
            text: "Hi, This item is still available?",
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: "Good night, This item is only available in size 42 and 43",
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: BackgroundColor3,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: BackgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                "assets/profile_online.png",
                width: 50,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shoe Store",
                    style: PrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    "Online",
                    style: SecondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70),
      ),
      bottomNavigationBar: ChatInput(),
      body: content(),
    );
  }
}
