import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6574CF);
const kTextFaintColor = Color(0xFF8F9BB3);
const kPrimaryLightColor = Color(0xFFF4F8FD);
const kSecondaryColor = Color(0xFF1Ec760);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);
const kAshColor = Color(0XFF6B6B6B);

final kDefaultShadow =BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 3,
    color: Colors.black.withOpacity(0.1)
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: kTextColor)
  );
}

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kHeightNullError = "Please Enter your height";
const String kWidthNullError = "Please Enter your width";