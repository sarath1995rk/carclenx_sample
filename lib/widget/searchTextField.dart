import 'package:carclenx_sample/resources/asset.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 30,
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              borderSide: BorderSide(color: Colors.white, width: 1.0)),
          prefixIcon: Image.asset(
            kFilterIcon,
            scale: 3,
            color: Colors.white,
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 18,
          ),
          hintStyle:
              TextStyle(color: Colors.white, fontFamily: "WorkSansLight"),
        ),
      ),
    );
  }
}
