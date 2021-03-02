import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    @required this.color1,
    @required this.color2,
    @required this.text,
  }) : super(key: key);

  final Color color1, color2;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenHeight(8),
            width: getProportionateScreenWidth(160),
            color: color1,
          ),
          Container(
            height: getProportionateScreenHeight(90),
            width: getProportionateScreenWidth(160),
            color: color2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: getProportionateScreenWidth(15)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.device_hub, size: getProportionateScreenWidth(12),color: kTextFaintColor,),
                    SizedBox(width: 5,),
                    Text('50 Spacialists',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenWidth(10),
                          color: kTextFaintColor
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}