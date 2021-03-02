import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_medical/screens/login/login_screen.dart';
import 'package:flutter_medical/screens/unboard/components/unboard_content.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> unboardData = [
      {
        "text": "Consequat interdum varius sit amet mattis "
            "vulputate enim nulla aliquet. Et magnis dis "
            "montes nascetur ridiculus mus mauris vitae.",
        "image": "assets/images/undraw.png"
      },
      {
        "text":
        "Lorem ipsum dolor sit amet, consectetur adipis, "
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        "image": "assets/images/undraw2.png"
      },
      {
        "text": "labore et dolore magna aliqua. Purus faucibus ornare "
            "suspendisse sed. Velit laoreet id donec ultrices tincidunt arcu non.",
        "image": "assets/images/undraw3.png"
      },
    ];
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Skip',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(15),
                        color: kPrimaryColor
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 5,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: unboardData.length,
                  itemBuilder: (context, index) => UnboardContent(
                    text: unboardData[index] ['text'],
                    image: unboardData[index] ['image'],
                  ),
                ),
              ),
              // SizedBox(height: 20,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: List.generate(unboardData.length, (index) => buildDot(index: index)),
                    ),
                    FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Row(
                          children: [
                            Text('NEXT', style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                color: Colors.white
                            ),),
                            SizedBox(width: 10,),
                            SvgPicture.asset('assets/svg/right-arrow.svg',
                              height: getProportionateScreenWidth(10),
                              width: getProportionateScreenWidth(10),
                              color: Colors.white,
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
              duration: kAnimationDuration,
              margin: EdgeInsets.only(right: 5),
              height: 6,
              width: currentPage == index ? 20 : 6,
              decoration: BoxDecoration(
                color: currentPage == index ? kPrimaryColor : kTextFaintColor ,
                borderRadius: BorderRadius.circular(3),
              ),
            );
  }
}




