import 'package:flutter/material.dart';
import 'package:flutter_medical/screens/sign_up/components/signup_form.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenWidth(15),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Register Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(25),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Please enter your credentials to \n proceed to Digital Clinic',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(12),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(30),),
                SignUpForm(),
                SizedBox(height: 15,),
                Text(
                  'OR CONNECT USING',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                SizedBox(height: getProportionateScreenWidth(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocial(
                      img: 'assets/svg/google-plus.svg',
                    ),
                    CustomSocial(
                      img: 'assets/svg/facebook.svg',
                    ),
                    CustomSocial(
                      img: 'assets/svg/twitter.svg',
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(10) ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(fontSize: getProportionateScreenWidth(14)),
                    ),
                    Text(
                      " Sign Up",
                      style: TextStyle(fontSize: getProportionateScreenWidth(14),
                          color: kPrimaryColor
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSocial extends StatelessWidget {
  const CustomSocial({
    Key key,
    @required this.img,
  }) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        height: getProportionateScreenWidth(50),
        width: getProportionateScreenWidth(50),
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            shape: BoxShape.circle,
            border: Border.all(color: kPrimaryColor)),
        child: SvgPicture.asset(
          img,
          color: kPrimaryColor,
        ));
  }
}
