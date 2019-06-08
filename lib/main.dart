import 'package:flutter/material.dart';

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
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                SizedBox(height: 18.0,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                  IconButton(icon: Icon(Icons.account_circle, color: HexColor("f48022"),size: 28,) , onPressed: ()=>{},)
                ],)
                ,Stack(
                  children: <Widget>[

                  ],
                )
              ],
            ),
          ),
        );
      }
    }


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

