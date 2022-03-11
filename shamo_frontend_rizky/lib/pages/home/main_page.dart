// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:shamo_frontend_rizky/pages/home/chat_page.dart';
import 'package:shamo_frontend_rizky/pages/home/home_page.dart';
import 'package:shamo_frontend_rizky/pages/home/profile_page.dart';
import 'package:shamo_frontend_rizky/pages/home/wishlist_page.dart';

import '../../utils/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget CartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: SecondaryColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget CustomNavbar() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: BackgroundColor4,
              type: BottomNavigationBarType.fixed,
              currentIndex: CurrentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  CurrentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 20,
                      color:
                          CurrentIndex == 0 ? PrimaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_chat.png',
                      width: 19,
                      color:
                          CurrentIndex == 1 ? PrimaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_favorite.png',
                      width: 20,
                      color:
                          CurrentIndex == 2 ? PrimaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 18,
                      color:
                          CurrentIndex == 3 ? PrimaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                )
              ]),
        ),
      );
    }

    Widget Body() {
      switch (CurrentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: CurrentIndex == 0 ? BackgroundColor1 : BackgroundColor3,
      floatingActionButton: CartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(),
      body: Body(),
    );
  }
}
