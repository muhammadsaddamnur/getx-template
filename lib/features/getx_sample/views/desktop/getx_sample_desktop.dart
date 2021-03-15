import 'package:flutter/material.dart';

class GetxSampleDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.home, color: Colors.red), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.home, color: Colors.red), onPressed: () {})
        ],
      ),
      body: Center(child: Text('Desktop')),
    );
  }
}
