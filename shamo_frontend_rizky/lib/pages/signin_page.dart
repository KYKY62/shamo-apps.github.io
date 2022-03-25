// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend_rizky/provider/auth_provider.dart';
import 'package:shamo_frontend_rizky/widgets/loading_button.dart';

import '../utils/theme.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    authProvider AuthProvider = Provider.of<authProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await AuthProvider.login(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      )) {
        Navigator.pushNamed(context, '/mainPage');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AlertColor,
            content: Text(
              "Gagal Login",
              textAlign: TextAlign.center,
              style: PrimaryTextStyle,
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
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style:
                  PrimaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            SizedBox(height: 2),
            Text(
              "Sign In to Countinue",
              style: SubTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            )
          ],
        ),
      );
    }

    Widget EmailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style:
                  PrimaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
                        controller: emailcontroller,
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
              style:
                  PrimaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
                        controller: passwordcontroller,
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
            onPressed: handleSignIn,
            style: TextButton.styleFrom(
                backgroundColor: PrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: Text(
              "Sign in",
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
              "Don't have an account? ",
              style: SubTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signupPage'),
              child: Text(
                " Sign up",
                style:
                    PurpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: BackgroundColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                EmailInput(),
                PasswordInput(),
                isLoading ? LoadingButton() : SigninButton(),
                Spacer(),
                footer(),
              ],
            ),
          ),
        ));
  }
}
