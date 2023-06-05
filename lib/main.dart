import 'package:flutter/material.dart';

import 'const/constanse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constance.myWhite,
          elevation: 0.0,
          actions: [
            InkWell(
              child: Text(
                Constance.titleAppbar,
                style: TextStyle(color: Constance.myBlack),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [],
        ));
  }
}
