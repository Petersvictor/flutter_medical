import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(40),
      width: MediaQuery.of(context).size.width - 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search Doctors, Clinics...',
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.search,
            size: getProportionateScreenWidth(20),
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: 12, horizontal: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(5)),
              borderSide: BorderSide(color: Colors.white),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(5)),
              borderSide: BorderSide(color: kTextColor),
              gapPadding: 10),
        ),
      ),
    );
  }
}