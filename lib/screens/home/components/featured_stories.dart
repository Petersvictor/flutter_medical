import 'package:flutter/material.dart';
import 'package:flutter_medical/models/product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class FeaturedStories extends StatelessWidget {
  const FeaturedStories({
    Key key,
    @required this.demo,
  }) : super(key: key);

  final Demo demo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
      child: Container(
        height: getProportionateScreenHeight(330),
        width: getProportionateScreenWidth(220),
        decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor.withOpacity(0.5),
            ),
            color: Colors.white,
            boxShadow: [kDefaultShadow],
            borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: getProportionateScreenHeight(200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            demo.docImage,
                          )
                      )
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.3),
                  ),
                ),
                Positioned(
                    top: getProportionateScreenHeight(170),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                      child: Row(
                        children: [
                          Icon(Icons.timer, size: getProportionateScreenHeight(20), color: Colors.white,),
                          SizedBox(width: 3,),
                          Text('3 Min',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(12),
                                fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenWidth(7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Far away, Behind the world mountains',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: getProportionateScreenWidth(15)
                    ),
                  ),
                  Text(
                    '2 hours ago',
                    style: TextStyle(
                        color: kTextFaintColor,
                        fontSize: getProportionateScreenWidth(13),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  // SizedBox(height: 25,),

                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenWidth(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: getProportionateScreenWidth(18),
                        color: kTextFaintColor,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        '155',
                        style: TextStyle(
                          color: kTextFaintColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.share,  size: getProportionateScreenWidth(18),
                        color: kTextFaintColor,),
                      SizedBox(width: 6,),
                      Icon(Icons.bookmark_border,  size: getProportionateScreenWidth(18),
                        color: kTextFaintColor,)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}