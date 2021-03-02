import 'package:flutter/material.dart';
import 'package:flutter_medical/models/product.dart';
import 'package:flutter_medical/screens/doctor_details/doctors_details.dart';
import 'package:flutter_medical/screens/doctors/doctors_list.dart';
import 'package:flutter_medical/screens/home/components/search_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getProportionateScreenWidth(135),
              width: double.infinity,
              decoration: BoxDecoration(color: kPrimaryColor),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(12),
                    vertical: getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Search Doctors',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15,),
                    SearchBox(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Category(text: 'All', onSelected: true,),
                  Category(text: 'Cardio',),
                  Category(text: 'Opthamologist',),
                  Category(text: 'Dentist',),
                  Category(text: 'Physio Therapy',),
                ],
              ),
            ),
            Column(
              children: List.generate(5, (index) => Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(15),
                    right: getProportionateScreenWidth(20),
                    top: getProportionateScreenWidth(7),
                    bottom: getProportionateScreenWidth(10)
                ),
                child: DoctorsListCard(
                  demo: demoItems[index],
                ),
              ))
            )
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key key, this.text, this.onSelected = false,
  }) : super(key: key);

  final String text;
  final bool onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: getProportionateScreenWidth(40),
        padding:EdgeInsets.symmetric(horizontal: 20.0, vertical:8),
        decoration: BoxDecoration(
        color: onSelected ? kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.circular(5),
          boxShadow: [kDefaultShadow]
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w500,
              color: onSelected ? Colors.white : Colors.black
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorsListCard extends StatelessWidget {
  const DoctorsListCard({
    Key key, this.demo, this.image,
  }) : super(key: key);

  final Demo demo;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorsDetails()));
      },
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(120),
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
        right: getProportionateScreenWidth(20),
        top: getProportionateScreenWidth(7),
        bottom: getProportionateScreenWidth(10)
    ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: getProportionateScreenHeight(80),
                  width: getProportionateScreenHeight(80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [kDefaultShadow],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(demo.docImage)
                    )
                  ),
                ),
                Positioned(
                  bottom: -2,
                  right: -3,
                  child: Container(
                    height: getProportionateScreenWidth(12),
                    width: getProportionateScreenWidth(12),
                    decoration: BoxDecoration(
                        color: Colors.green,
                      borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(
                  demo.docFullName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(16)
                  ),
                ),
                Text(
                  'Opthamologist',
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: getProportionateScreenWidth(13),
                    color: kAshColor
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) => Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: Icon(Icons.star, color: kPrimaryColor, size: getProportionateScreenWidth(18),),
                  )),
                )
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: getProportionateScreenWidth(45),
                  width: getProportionateScreenWidth(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kPrimaryColor.withOpacity(0.2),
                  ),
                  child: Icon(
                    FontAwesomeIcons.commentDots,
                    size: getProportionateScreenWidth(16),
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  height: getProportionateScreenWidth(45),
                  width: getProportionateScreenWidth(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kPrimaryColor.withOpacity(0.1),
                  ),
                  child: Icon(
                    FontAwesomeIcons.phone,
                    size: getProportionateScreenWidth(16),
                    color: kPrimaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
