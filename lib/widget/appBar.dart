import 'package:carclenx_sample/resources/asset.dart';
import 'package:carclenx_sample/resources/strings.dart';
import 'package:flutter/material.dart';

class AppBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Image.asset(
                kSideMenu,
                color: Colors.white,
                scale: 2.5,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                kCarShop,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.shopping_basket_rounded,
                color: Colors.white,
                size: 19,
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 19,
              )
            ],
          )
        ],
      ),
    );
  }
}
