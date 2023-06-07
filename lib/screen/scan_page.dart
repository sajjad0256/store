import 'package:flutter/material.dart';

class MyScan extends StatefulWidget {
  const MyScan({super.key});

  @override
  State<MyScan> createState() => _MyScanState();
}

class _MyScanState extends State<MyScan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Scan page'),
      ),
    );
  }
}
