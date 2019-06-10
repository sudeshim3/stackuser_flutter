import 'package:flutter/material.dart';
import 'models/BarItem.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;

  AnimatedBottomBar(
      {this.barItems, this.animationDuration = const Duration(seconds: 5)});

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> barItems = List();
    for (var i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: isSelected ? item.color.withOpacity(0.80) : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Row(
            children: <Widget>[
              Icon(
                item.icon,
                color: isSelected ? Colors.white: Colors.black,
              ),
              SizedBox(
                width: 10.0,
              ),
              AnimatedSize(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                vsync: this,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return barItems;
  }
}
