import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:flutter_medical/screens/profile/components/body.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomNavBar(),
      backgroundColor: kPrimaryColor,
      body:Body(),
    );
  }
}
