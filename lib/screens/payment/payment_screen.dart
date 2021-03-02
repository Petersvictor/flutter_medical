import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/screens/upgrade_to_pro/upgrade_pro.dart';
import 'package:flutter_medical/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Finish',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenWidth(15),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(220),
                  width: SizeConfig.screenWidth - 20,
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(350),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      SizedBox(height:getProportionateScreenHeight(10),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: getProportionateScreenHeight(50),
                            width:  getProportionateScreenWidth(180),
                            decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(50),
                            width:  getProportionateScreenWidth(120),
                            decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(5),),
                Column(
                  children: [
                    Text(
                      'By adding debit/credit card, you agree to the',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w200,
                        color: kTextColor,
                      ),
                    ),
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(20),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/user.svg',
                          color: kAshColor,
                          height: getProportionateScreenWidth(18),
                        ),
                        SizedBox(width: 3,),
                        Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kAshColor,
                            fontSize: getProportionateScreenWidth(18),
                          ),
                        )
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Card holder full name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        )
                      ),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(15),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Icon(
                         Icons.credit_card_rounded,
                         size: getProportionateScreenWidth(24),
                         color: kAshColor,
                       ),
                        SizedBox(width: 3,),
                        Text(
                          'Card Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kAshColor,
                            fontSize: getProportionateScreenWidth(18),
                          ),
                        )
                      ],
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Card number',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        )
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(15),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: SizeConfig.screenWidth / 2.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.credit_card_rounded,
                                size: getProportionateScreenWidth(24),
                                color: kAshColor,
                              ),
                              SizedBox(width: 3,),
                              Text(
                                'Expiry date',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kAshColor,
                                  fontSize: getProportionateScreenWidth(18),
                                ),
                              )
                            ],
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                hintText: 'DD-MM-YYYY',
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth / 2.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.credit_card_rounded,
                                size: getProportionateScreenWidth(24),
                                color: kAshColor,
                              ),
                              SizedBox(width: 3,),
                              Text(
                                'CVV',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kAshColor,
                                  fontSize: getProportionateScreenWidth(18),
                                ),
                              )
                            ],
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter CVV number',
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(55),),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpgradeToPro()));
                  },
                  child: Container(
                    height: getProportionateScreenHeight(55),
                    width: SizeConfig.screenWidth - 20,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
