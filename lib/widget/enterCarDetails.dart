import 'package:carclenx_sample/resources/asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterCarDetails extends StatelessWidget {
  const EnterCarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          kCarIcon,
          scale: 2.6,
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: const Text(
            'Enter car details >>',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    );
  }
}
