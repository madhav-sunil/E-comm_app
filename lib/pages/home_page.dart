import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-comm app'),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile();
        }),
      ),
    );
  }
}
