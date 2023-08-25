import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Sanjeev";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold to design basic layout
      appBar: AppBar(
        //use to make nav bar
        title: Text("Catalogie App"),
      ),
      body: Center(
        child: Container(
            child: Text("Welcome to $days days of  flutter by $name")),
      ),
      drawer: Drawer(),
    );
  }
}
