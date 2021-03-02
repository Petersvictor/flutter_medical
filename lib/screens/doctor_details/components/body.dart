import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/models/doctor_model.dart';
import '../../../constants.dart';
import 'package:flutter_medical/size_config.dart';
import 'package:flutter_medical/screens/appointment_flow/appoitment.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  DoctorModel doctorModel = DoctorModel(
    occupation: "",
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('doctors');
    return SafeArea(
      child: FutureBuilder(
        future: users.doc('VIxsWGvMUpfQfRCdUcZkGYzTdDg2')
            .get()
            .then((value) {
          doctorModel.name = value.data()['name'];
          doctorModel.occupation = value.data()['occupation'];
          doctorModel.profile = value.data()['profile'];
          doctorModel.services = List.castFrom(value.data()['services'] );
        }),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(18),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getProportionateScreenWidth(130),
                        width: getProportionateScreenWidth(120),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  color: Colors.black.withOpacity(0.2))
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/national-doctors-day-1.jpg'),
                            )),
                      ),
                      SizedBox(width: getProportionateScreenWidth(10),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorModel.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4,
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.black
                            ),
                          ),
                          Text(
                            doctorModel.occupation,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenWidth(14),
                              color: kAshColor,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenWidth(10),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(5, (index) => Padding(
                              padding: EdgeInsets.only(right: 2),
                              child: Icon(Icons.star, color: kPrimaryColor, size: getProportionateScreenWidth(20),),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10),),
                Expanded(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: getProportionateScreenWidth(250),
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20),
                          left: getProportionateScreenWidth(20),
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [kDefaultShadow],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About Doctor',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: getProportionateScreenWidth(10),),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                doctorModel.profile,
                                maxLines: 4,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getProportionateScreenWidth(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: getProportionateScreenWidth(150),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          padding: EdgeInsets.only(
                            top: getProportionateScreenWidth(15),
                            right: getProportionateScreenWidth(20),
                            left: getProportionateScreenWidth(20),
                          ),
                          decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Services',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.bold,
                                    color: kAshColor
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(doctorModel.services.length, (index) => Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: DoctorsServices(
                                    service: doctorModel.services[index].toString(),
                                  ),
                                )),
                              ),
                              SizedBox(height: getProportionateScreenWidth(20),),
                              Text(
                                'Availability',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.bold,
                                    color: kAshColor
                                ),
                              ),
                              SizedBox(height: getProportionateScreenWidth(10),),
                              Text(
                                'Monday - Friday, 09:00 AM - 4:00 PM ',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.w500,
                                    color: kAshColor
                                ),
                              ),
                              SizedBox(height: getProportionateScreenWidth(50),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: getProportionateScreenHeight(55),
                                    width: getProportionateScreenWidth(55),
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      color: kPrimaryColor,
                                      size: getProportionateScreenWidth(25),
                                    ),
                                  ),
                                  InkWell(
                                    onTap : () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Appointment()));
                                    },
                                    child: Container(
                                      height: getProportionateScreenHeight(55),
                                      width: getProportionateScreenWidth(270),
                                      decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book Appointment',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:  getProportionateScreenWidth(18),
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}


Column buildDivider({bool isSelected, String title}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.bold,
              color: isSelected ? kPrimaryColor : kTextFaintColor),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: isSelected
              ? getProportionateScreenWidth(3)
              : getProportionateScreenWidth(2),
          width: SizeConfig.screenWidth / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: isSelected ? kPrimaryColor : kPrimaryLightColor),
        )
      ],
    );
  }

class Availability extends StatelessWidget {
  const Availability({
    Key key,
    @required this.availa,
  }) : super(key: key);

  final String availa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(15),
          top: getProportionateScreenWidth(15)),
      child: Row(
        children: [
          Icon(
            Icons.event_note,
            size: getProportionateScreenWidth(18),
            color: kTextFaintColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            availa,
            style: TextStyle(
                color: kTextFaintColor,
                fontSize: getProportionateScreenWidth(12),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class DoctorsServices extends StatelessWidget {
  const DoctorsServices({
    Key key,
    @required this.service,
  }) : super(key: key);

  final String service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          // left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(15),
          top: getProportionateScreenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(200),
            child: Text(
              service,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.w500,
                  color: kAshColor
              ),
            ),
          ),
          Icon(
            Icons.check_circle_outline,
            size: getProportionateScreenWidth(22),
            color: kAshColor,
          )
        ],
      ),
    );
  }
}
