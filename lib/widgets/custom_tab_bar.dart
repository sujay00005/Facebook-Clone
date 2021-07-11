import 'package:facebook_clone/configuration/pallet.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap; //Function returns an int

  const CustomTabBar(
      {required this.icons, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // TabBar requies tabs
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        //to set indicator at top
        border: Border(
          top: BorderSide(color: Palette.facebookBlue, width: 3.0),
        ),
      ),
      tabs: icons
          .asMap()
          //we are getting index of tab so we need to convert list of icons to a map which gives us access to index and icon
          // we have list of icons so we map each of the icons to a tab
          .map(
            (i, e) => MapEntry(
              //when we do .map over map we need to return map entry
              i, //i as the key
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values //to get icons back we do .values
          .toList(), // values back to list
      onTap: onTap,
      // to convert the map back to the list since .maps returns an iterable so .toList converts it back to a list of tabs
    );
  }
}
