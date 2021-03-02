import 'package:flutter/material.dart';
import 'package:flutter_medical/models/session_details.dart';
import 'package:flutter_medical/screens/payment/payment_screen.dart';
import 'package:flutter_medical/size_config.dart';

import '../../constants.dart';

class AppointmentFinish extends StatefulWidget {
  final SessionDetails sessionDetails;
  final String comment;
  AppointmentFinish({Key key, @required this.sessionDetails, this.comment}) : super(key: key);
  @override
  _AppointmentFinishState createState() => _AppointmentFinishState();
}

class _AppointmentFinishState extends State<AppointmentFinish> {

  int selectedIndex;
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
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  'Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              DetailsType(
                title: "Doctor",
                detail: widget.sessionDetails.comment,
                icon: Icons.account_circle_outlined,
              ),
              DetailsType(
                title: "Type",
                detail: 'Video  Visit',
                icon: Icons.video_call_outlined,
              ),
              DetailsType(
                title: "Date",
                detail: '25th May, 2020',
                icon: Icons.date_range,
              ),
              DetailsType(
                title: "Time",
                detail: '11:00 - 11:30',
                icon: Icons.timer,
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                child: Container(
                  height: getProportionateScreenHeight(55),
                  width: SizeConfig.screenWidth - 20,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Continue to Payment',
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
        )
      ),
    );
  }
}

class DetailsType extends StatelessWidget {
  const DetailsType({
    Key key,
    @required this.title,
  @required this.detail,
  @required this.icon,
  }) : super(key: key);

  final String title, detail;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(10)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                  Text(
                    detail,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(16),
                    ),
                  )
                ],
              ),
              Icon(icon, color: kTextColor, size: getProportionateScreenWidth(20) ,),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          Divider(),
        ],
      ),
    );
  }
}
