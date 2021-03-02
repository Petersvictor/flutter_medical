import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class UnboardContent extends StatelessWidget {
  const UnboardContent({
    Key key, this.image, this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getProportionateScreenWidth(20),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'to Digital Clinic',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              text,
              maxLines: 3,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kTextFaintColor,
              ),
            )
          ],
        ),
        SizedBox(height: getProportionateScreenWidth(20),),
        Image.asset(image,
        height: getProportionateScreenHeight(350),
        width: double.infinity,
          fit: BoxFit.cover,
        )

      ],
    );
  }
}