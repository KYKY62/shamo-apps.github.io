// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/models/message_model.dart';
import 'package:shamo_frontend_rizky/provider/auth_provider.dart';
import 'package:shamo_frontend_rizky/provider/page_provider.dart';
import 'package:shamo_frontend_rizky/service/message_service.dart';
import 'package:shamo_frontend_rizky/widgets/chat_tile.dart';

import '../../utils/theme.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    authProvider AuthProvider = Provider.of<authProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget Header() {
      return AppBar(
        backgroundColor: BackgroundColor1,
        centerTitle: true,
        title: Text(
          "Message Support",
          style: PrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget EmptyMsg() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: BackgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image_nomessage.png',
                width: 80,
              ),
              SizedBox(height: 20),
              Text(
                "Opss no message yet?",
                style: PrimaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "You have never done a transaction",
                style: SecondaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              SizedBox(height: 20),
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
                    )),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: AuthProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return EmptyMsg();
              }

              return Expanded(
                  child: Container(
                width: double.infinity,
                color: BackgroundColor3,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  children: [
                    ChatTile(snapshot.data![snapshot.data!.length - 1]),
                  ],
                ),
              ));
            } else {
              return EmptyMsg();
            }
          });
    }

    return Column(
      children: [
        Header(),
        content(),
      ],
    );
  }
}
