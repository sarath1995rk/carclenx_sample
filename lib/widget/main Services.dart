import 'package:carclenx_sample/resources/asset.dart';
import 'package:flutter/material.dart';

class MainServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          color: Color(0xFF303030), borderRadius: BorderRadius.circular(15)),
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: Image.asset(kShopOfferingProduct)),
          Expanded(child: Image.asset('assets/images/carspa.png')),
          Expanded(child: Image.asset('assets/images/mechanical.png')),
          Expanded(child: Image.asset('assets/images/quick.png'))
        ],
      ),
    );
  }
}
