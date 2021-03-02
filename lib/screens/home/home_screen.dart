import 'package:flutter/material.dart';
import 'package:flutter_medical/components/custom_nav_bar.dart';
import 'package:flutter_medical/screens/home/components/body.dart';
import 'package:flutter_medical/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Body(),
    );
  }
}
