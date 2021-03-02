import 'package:flutter/material.dart';
import 'package:flutter_medical/models/product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class TrendingArticles extends StatelessWidget {
  const TrendingArticles({
    Key key,
    @required this.demo,
  }) : super(key: key);

  final Demo demo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenWidth(150),
          width: getProportionateScreenWidth(280),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    demo.img,
                  ))),
        ),
        Container(
          height: getProportionateScreenWidth(150),
          width: getProportionateScreenWidth(280),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenWidth(6)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12 JUL 2020',
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(10),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.7),
                    ),
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    )
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      demo.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          demo.description,
                          style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: getProportionateScreenWidth(12),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: getProportionateScreenWidth(16),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}