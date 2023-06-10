import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store/screen/camera_page.dart';
import '../const/constanse.dart';

class MyScan extends StatefulWidget {
  const MyScan({super.key});

  @override
  State<MyScan> createState() => _MyScanState();
}

class _MyScanState extends State<MyScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constance.myWhite,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Constance.myWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Constance.myWhiteTwo,
                ),
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Constance.myGreenLightTwo,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Constance.myWhiteTwo,
                ),
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Constance.myGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                        child: const CameraPage(),
                        type: PageTransitionType.bottomToTop),
                  );
                },
                child: Image.asset('assets/images/code-scan.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(
                Constance.scanClick,
                style: TextStyle(
                    fontSize: 20,
                    color: Constance.myGreen,
                    fontFamily: 'BTitrBd'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
