// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/models/user_model.dart';
import 'package:shamo_frontend_rizky/provider/auth_provider.dart';

import '../../utils/theme.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authProvider AuthProvider = Provider.of<authProvider>(context);
    UserModel user = AuthProvider.user;

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: SecondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: PrimaryTextStyle,
              decoration: InputDecoration(
                  hintText: user.name,
                  hintStyle: PrimaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: SubtitleColor,
                  ))),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: SecondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: PrimaryTextStyle,
              decoration: InputDecoration(
                  hintText: "@${user.username}",
                  hintStyle: PrimaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: SubtitleColor,
                  ))),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: SecondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: PrimaryTextStyle,
              decoration: InputDecoration(
                hintText: user.email,
                hintStyle: PrimaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: SubtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: defaultMargin),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(user.profilephotourl),
                  ),
                ),
              ),
              nameInput(),
              usernameInput(),
              emailInput(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: BackgroundColor3,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        backgroundColor: BackgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Edit Profile",
          style: PrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
            color: PrimaryColor,
          )
        ],
      ),
      body: content(),
    );
  }
}
