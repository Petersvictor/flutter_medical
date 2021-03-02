import 'package:flutter/material.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/models/product.dart';
import '../../../size_config.dart';

class DoctorsCircle extends StatelessWidget {
  const DoctorsCircle({
    Key key, @required this.demo, this.isSmall = false,
  }) : super(key: key);

  final Demo demo;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(12),
        right: getProportionateScreenWidth(12),
      ),
      child: Container(
        height: getProportionateScreenHeight(160),
        width: getProportionateScreenWidth(130),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [kDefaultShadow]
        ),
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(100),
              width: getProportionateScreenWidth(130),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(demo.img)
                )
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(6),),
            Text(
              demo.docFullName,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              demo.docOccupation,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  fontWeight: FontWeight.w500,
                  color: kAshColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}