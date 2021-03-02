import 'package:flutter/material.dart';
import 'package:flutter_medical/size_config.dart';
import 'package:flutter_medical/constants.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key, @required this.text, @required this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(56),
      width: double.infinity,
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: kPrimaryColor,
          onPressed: press,
          child: Text(text, style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white
          ),)
      ),
    );
  }
}
