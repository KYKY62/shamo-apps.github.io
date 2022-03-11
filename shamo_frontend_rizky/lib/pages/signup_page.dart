// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../utils/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget header() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style:
                PrimaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
          SizedBox(height: 2),
          Text(
            "Register and Happy Shoping",
            style: SubTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          )
        ],
      ),
    );
  }

  Widget FullNameInput() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Full Name",
            style: PrimaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: BackgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_fullname.png',
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      style: PrimaryTextStyle,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration.collapsed(
                        hintText: "Your Full Name",
                        hintStyle: SubTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget UserNameInput() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: PrimaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: BackgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_username.png',
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      style: PrimaryTextStyle,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration.collapsed(
                          hintText: "Your Username",
                          hintStyle: SubTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget EmailInput() {
    return Container(
      margin: EdgeInsets.only(top: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: PrimaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: BackgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_email.png',
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      style: PrimaryTextStyle,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration.collapsed(
                        hintText: "Your Email Address",
                        hintStyle: SubTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget PasswordInput() {
    return Container(
      margin: EdgeInsets.only(top: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: PrimaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: BackgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_password.png',
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      style: PrimaryTextStyle,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintText: "Your Password",
                        hintStyle: SubTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget SigninButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/mainPage'),
          style: TextButton.styleFrom(
              backgroundColor: PrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            "Sign Up",
            style: PrimaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )),
    );
  }

  Widget footer() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: SubTextStyle.copyWith(fontSize: 12, fontWeight: regular),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Sign In",
              style: PurpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor1,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  FullNameInput(),
                  UserNameInput(),
                  EmailInput(),
                  PasswordInput(),
                  SigninButton(),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                  ),
                  footer(),
                ],
              ),
            ),
          ),
        ));
  }
}
