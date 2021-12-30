import 'package:carclenx_sample/resources/asset.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          backgroundColor: Color(0xFFfeec4f),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                kHomeIcon,
                scale: 2.5,
              ),
              label: 'Home',
              backgroundColor: Color(0xFFfeec4f),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                kShareIcon,
                scale: 2.5,
              ),
              label: 'Share',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  kProfileIcon,
                  scale: 2.5,
                ),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  kHistoryIcon,
                  scale: 2.5,
                ),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  kCoinIcon,
                  scale: 2.5,
                ),
                label: 'Coins'),
          ],
        ),
      ),
    );
  }
}
