import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../size_config.dart';

class TopCategory extends StatelessWidget {
  const TopCategory({
    Key key,
    @required this.title,
    @required this.img,
    @required this.color,
  }) : super(key: key);

  final String title, img;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(12),
        vertical: getProportionateScreenWidth(5),
      ),
      height: getProportionateScreenWidth(132),
      width: getProportionateScreenWidth(93),
      decoration: BoxDecoration(
        color: color,
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: kPrimaryColor.withOpacity(0.4))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            img,
            height: getProportionateScreenWidth(40),
            width: getProportionateScreenWidth(40),
            color: Colors.white,
            // color: kPrimaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
           title,
            style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}