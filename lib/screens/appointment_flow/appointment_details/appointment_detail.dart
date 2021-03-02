import 'package:flutter/material.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/models/age_range.dart';
import 'package:flutter_medical/models/session_details.dart';
import 'package:flutter_medical/models/visitTypes.dart';
import 'package:flutter_medical/screens/appointment_flow/appointment_finish.dart';
import 'package:flutter_medical/size_config.dart';

class AppointmentDetail extends StatefulWidget {
  final SessionDetails sessionDetails;
  AppointmentDetail({Key key, @required this.sessionDetails}) : super(key: key);

  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  TextEditingController _commentController = TextEditingController();
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFEDF1F7),
        appBar: AppBar(
          title: Text(
            'Appointment',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenWidth(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      'Age',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(ageRange.length, (index) {
                        return AgeSelector(
                          ageRange: ageRange[index],
                          textColor: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          containerColor: selectedIndex == index
                              ? kSecondaryColor
                              : Colors.white,
                          press: () {
                            setState(() {
                              selectedIndex = index;
                              widget.sessionDetails.age = ageRange[index].age;
                            });
                          },
                        );
                      }),
                    ],
                  ),
                  Text(widget.sessionDetails.age.toString()),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      'Write your problem',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(11),
                  ),
                  Container(
                    // height: getProportionateScreenWidth(180),
                    width: double.infinity,
                    child: TextField(
                      controller: _commentController,
                      maxLines: 10,
                      maxLength: 200,
                      decoration: InputDecoration(
                        hintText:
                            'I am having little headache and i need to talk to a doctor',
                        hintStyle: TextStyle(fontSize: 18, color: kTextColor),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(5)),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(5)),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(55)),
                  InkWell(
                    onTap: ()  {
                      widget.sessionDetails.comment = _commentController.text;
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppointmentFinish(
                                    sessionDetails: widget.sessionDetails,
                                  )));
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
        ));
  }
}

class AgeSelector extends StatelessWidget {
  const AgeSelector({
    Key key,
    this.ageRange,
    this.textColor,
    this.containerColor,
    this.press,
    this.ageChoice,
  }) : super(key: key);

  final AgeRange ageRange;
  final Color textColor, containerColor;
  final GestureTapCallback press;
  final String ageChoice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: getProportionateScreenWidth(80),
        width: getProportionateScreenWidth(70),
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            ageRange.age,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(22),
                color: textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class VisitTypeFees extends StatelessWidget {
  VisitTypeFees({
    Key key,
    this.visitTypes,
    this.color,
    this.press,
    this.amountColor,
    this.titleColor,
    this.subTitleColor,
    this.iconColor,
    this.lilConColor,
  }) : super(key: key);
  final VisitTypes visitTypes;
  final Color color;
  final GestureTapCallback press;
  final Color amountColor;
  final Color titleColor;
  final Color subTitleColor;
  final Color iconColor;
  final Color lilConColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
      child: InkWell(
        onTap: press,
        child: Container(
          height: getProportionateScreenHeight(65),
          width: SizeConfig.screenWidth - 20,
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenWidth(7.5),
          ),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [kDefaultShadow]),
          child: Row(
            children: [
              Container(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenHeight(50),
                decoration: BoxDecoration(
                    color: lilConColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(visitTypes.icon, color: iconColor),
              ),
              SizedBox(
                width: getProportionateScreenWidth(7.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    visitTypes.title,
                    style: TextStyle(
                        color: titleColor,
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    visitTypes.subTitle,
                    style: TextStyle(
                        color: subTitleColor,
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),
              Text(
                visitTypes.amount,
                style: TextStyle(
                    color: amountColor,
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
