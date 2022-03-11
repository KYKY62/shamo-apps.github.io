// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: BackgroundColor1,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: defaultMargin,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/profile_default.png',
                  width: 64,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halo, Alex",
                        style: PrimaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        "@alexkeinn",
                        style: SubTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/button_exit.png', width: 20),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
      ],
    );
  }
}
