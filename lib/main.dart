import 'package:flutter/material.dart';
import 'package:stackuser_flutter/circular_reveal.dart';

void main() => runApp(MaterialApp(
  title: "StackDev",
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));


    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 18.0,),
                CircularReveal()
              ],
            ),
          ),
        );
      }
    }




