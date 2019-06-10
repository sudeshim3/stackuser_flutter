import 'package:flutter/material.dart';
import 'package:stackuser_flutter/circular_reveal.dart';
import 'animated_bottom_bar.dart';
import 'models/BarItem.dart';

void main() => runApp(MaterialApp(
      title: "StackDev",
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  final List<BarItem> barItems = [
    BarItem(text: "Question", icon: Icons.help_outline, color: Colors.indigo),
    BarItem(text: "Users", icon: Icons.person_outline, color: Colors.green),
    BarItem(text: "Job", icon: Icons.work, color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomBar(barItems: barItems,),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 18.0,
            ),
            CircularReveal()
          ],
        ),
      ),
    );
  }
}
