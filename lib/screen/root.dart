import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store/const/constanse.dart';
import 'package:store/screen/card_page.dart';
import 'package:store/screen/favorite_page.dart';
import 'package:store/screen/home_page.dart';
import 'package:store/screen/profile_page.dart';
import 'package:store/screen/scan_page.dart';

class MyRoot extends StatefulWidget {
  const MyRoot({super.key});

  @override
  State<MyRoot> createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  int bottonIndex = 0;
  List<Widget> pages = [
    const MyHomePage(),
    const MyFavorite(),
    const MyCard(),
    const MyProfile(),
  ];

  List<IconData> listIcons = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> appbarTitle = [
    'خانه',
    'علاقه مندی ها',
    'سبد خرید',
    'پروفایل کاربری',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constance.myWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Constance.myWhite,
        title: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: Constance.myGrey,
                size: Constance.sizeIconAppbar,
              ),
              Text(
                appbarTitle[bottonIndex],
                style: TextStyle(
                    color: Constance.myGrey,
                    fontSize: Constance.sizeTitle,
                    fontFamily: 'Lalezar'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constance.myGreenLight,
        onPressed: () {
          Navigator.of(context).push(
            PageTransition(
                child: const MyScan(), type: PageTransitionType.bottomToTop),
          );
        },
        child: Image.asset(
          'assets/images/code-scan.png',
          height: 30,
          color: Constance.myWhite,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constance.myGreyLight,
        activeColor: Constance.myBlack,
        gapLocation: GapLocation.center,
        inactiveColor: Colors.black.withOpacity(0.5),
        notchSmoothness: NotchSmoothness.softEdge,
        icons: listIcons,
        activeIndex: bottonIndex,
        onTap: (index) {
          setState(
            () {
              bottonIndex = index;
            },
          );
        },
      ),
      body: IndexedStack(
        index: bottonIndex,
        children: pages,
      ),
    );
  }
}
