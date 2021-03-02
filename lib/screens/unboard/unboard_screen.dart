import 'package:flutter/material.dart';
import 'package:flutter_medical/screens/unboard/components/body.dart';
import '../../size_config.dart';

class UnboardScreen extends StatelessWidget {
  static String routeName = "/unboard";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
