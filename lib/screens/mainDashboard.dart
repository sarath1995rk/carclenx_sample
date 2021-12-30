import 'package:carclenx_sample/resources/asset.dart';
import 'package:carclenx_sample/widget/appBar.dart';
import 'package:carclenx_sample/widget/bottomNavBar.dart';
import 'package:carclenx_sample/widget/enterCarDetails.dart';
import 'package:carclenx_sample/widget/main%20Services.dart';
import 'package:carclenx_sample/widget/productsGrid.dart';
import 'package:carclenx_sample/widget/searchTextField.dart';
import 'package:flutter/material.dart';

class MainDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .35,
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height * .35,
                    child: Image.asset(
                      kBanner1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AppBarMenu(),
                          const SizedBox(
                            height: 10,
                          ),
                          SearchTextField(),
                        ],
                      ),
                      Container(
                          height: 65,
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          color: Colors.black45,
                          child: EnterCarDetails())
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    MainServices(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Shoppe',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const Text('more >')
                        ],
                      ),
                    ),
                    Expanded(child: ProductsGrid()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
