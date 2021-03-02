import 'package:flutter/material.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/size_config.dart';

class UpgradeToPro extends StatefulWidget {
  @override
  _UpgradeToProState createState() => _UpgradeToProState();
}

class _UpgradeToProState extends State<UpgradeToPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upgrade to Pro',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProPlans(),
                    ProPlans(isSelected: true,),
                    ProPlans(),
                  ],
                ),
              ),
              Text(SizeConfig.screenWidth.toString()),
              Text(SizeConfig.screenHeight.toString()),
              SizedBox(height:getProportionateScreenWidth(25),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18),),
                child: Text(
                  'Visit Type and Fees',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height:getProportionateScreenWidth(15),),
              Column(
                children: [
                  ReviewWidget(),
                  ReviewWidget(),
                  ReviewWidget(),
                  ReviewWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(18),
        vertical: getProportionateScreenWidth(10),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(80),
        child: Row(
          children: [
            Container(
              height: getProportionateScreenHeight(80),
              width: getProportionateScreenWidth(80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.1)
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/national-doctors-day-1.jpg'),
                )
              ),
            ),
            SizedBox(width:getProportionateScreenWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(240),
                  child: Text(
                    'A very good platform to speak to a doctor,  Very good!!',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(17),
                      fontWeight: FontWeight.w500,
                      color: kAshColor
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) => Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    child: Icon(Icons.star, color: kPrimaryColor, size: getProportionateScreenWidth(20),),
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProPlans extends StatelessWidget {
  const ProPlans({
    Key key,
    this.bigContaierColor,
    this.smallContainerColor,
    this.textColor, this.iconColor,
    this.isSelected = false,
  }) : super(key: key);

  final Color bigContaierColor, smallContainerColor, textColor, iconColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: getProportionateScreenWidth(15),
        left: getProportionateScreenWidth(15),
        top: getProportionateScreenWidth(7.5),
        bottom: getProportionateScreenWidth(7.5),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: getProportionateScreenHeight(380),
        width: getProportionateScreenWidth(205),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenWidth(7.5),
        ),
        decoration: BoxDecoration(
          color: isSelected == true ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.2)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '6 Months Plan',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: isSelected == true ? Colors.white : kAshColor,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10),),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(7),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected == true ? kSecondaryColor : kAshColor,
                    size: getProportionateScreenWidth(18),
                  ),
                  SizedBox(width: getProportionateScreenWidth(7),),
                  Text(
                    'Covers Adult',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: isSelected == true ? Colors.white : kAshColor,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(7),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected == true ? kSecondaryColor : kAshColor,
                    size: getProportionateScreenWidth(18),
                  ),
                  SizedBox(width: getProportionateScreenWidth(7),),
                  Text(
                    'Covers Adult',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: isSelected == true ? Colors.white : kAshColor,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(7),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected == true ? kSecondaryColor : kAshColor,
                    size: getProportionateScreenWidth(18),
                  ),
                  SizedBox(width: getProportionateScreenWidth(7),),
                  Text(
                    'Covers Adult',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: isSelected == true ? Colors.white : kAshColor,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(7),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected == true ? kSecondaryColor : kAshColor,
                    size: getProportionateScreenWidth(18),
                  ),
                  SizedBox(width: getProportionateScreenWidth(7),),
                  Text(
                    'Covers Adult',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: isSelected == true ? Colors.white : kAshColor,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(7),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected == true ? kSecondaryColor : kAshColor,
                    size: getProportionateScreenWidth(18),
                  ),
                  SizedBox(width: getProportionateScreenWidth(7),),
                  Text(
                    'Covers Adult',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: isSelected == true ? Colors.white : kAshColor,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(7),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected == true ? kSecondaryColor : kAshColor,
                    size: getProportionateScreenWidth(18),
                  ),
                  SizedBox(width: getProportionateScreenWidth(7),),
                  Text(
                    'Covers Adult',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: isSelected == true ? Colors.white : kAshColor,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10),),
            Text(
              '\$25',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(22),
                fontWeight: FontWeight.bold,
                color: isSelected == true ? Colors.white : kAshColor,
              ),
            ),
            Spacer(),
            Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(205) -20,
              decoration: BoxDecoration(
                color: isSelected == true ? Colors.white : kPrimaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: isSelected == true ? kPrimaryColor : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(18)
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(7.5),)
          ],
        ),
      ),
    );
  }
}
