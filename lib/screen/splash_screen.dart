import 'package:flutter/material.dart';

import '../const/constanse.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  Widget _indicatorWidget(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      child: Container(
        width: isActive ? 20 : 8,
        height: 10,
        margin: const EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
          color: Constance.myPrimary,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIndecator() {
    List<Widget> listIndicator = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        listIndicator.add(_indicatorWidget(true));
      } else {
        listIndicator.add(_indicatorWidget(false));
      }
    }
    return listIndicator;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constance.myWhite,
      appBar: AppBar(
        backgroundColor: Constance.myWhite,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: InkWell(
              child: Text(
                Constance.titleAppbar,
                style: TextStyle(
                    color: Constance.myGrey,
                    fontSize: Constance.sizeTitleAppbar,
                    fontFamily: 'Lalezar'),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (pages) {
              setState(
                () {
                  currentIndex = pages;
                },
              );
            },
            controller: _pageController,
            children: [
              MySplashScree(
                image: 'assets/images/plant-one.png',
                title: Constance.titleOne,
                description: Constance.descriptionOne,
              ),
              MySplashScree(
                image: 'assets/images/plant-two.png',
                title: Constance.titleTwo,
                description: Constance.descriptionTwo,
              ),
              MySplashScree(
                image: 'assets/images/plant-three.png',
                title: Constance.titleThree,
                description: Constance.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 50,
            child: Row(
              children: _buildIndecator(),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 50,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Constance.myBlue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  width: 50,
                  height: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Constance.myWhite,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _pageController.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.ease);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MySplashScree extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const MySplashScree({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 350,
              child: Image.asset(image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                color: Constance.myGreen,
                fontSize: 28,
                fontFamily: 'BTitrBd',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 90, left: 90, top: 20),
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: TextStyle(
                color: Constance.myGreyLight,
                fontSize: 50,
                fontFamily: 'IranNastaliq',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
