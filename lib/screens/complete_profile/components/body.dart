import 'package:flutter/material.dart';
import 'package:flutter_medical/screens/complete_profile/components/complete_profile_form.dart';
import 'package:flutter_medical/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenWidth(15),
          ),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(30),),
              CompleteProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
