import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/models/product.dart';
import 'package:flutter_medical/screens/doctors/doctors_list.dart';
import 'package:flutter_medical/screens/home/components/doctors_circle.dart';
import 'package:flutter_medical/screens/home/components/top_category.dart';
import 'package:flutter_medical/screens/home/components/trending_articles.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'featured_stories.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Main Sections', press: () {},),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopCategory(
                    img: 'assets/svg/020-doctor.svg',
                    title: 'Doctor',
                    color: Color(0XFF129A7F),
                  ),
                  TopCategory(
                    img: 'assets/svg/010-health care.svg',
                    title: 'HealthCare',
                    color: Color(0XFF5554DB),
                  ),
                  TopCategory(
                    img: 'assets/svg/011-stethoscope.svg',
                    title: 'Sethoscope',
                    color: Color(0XFFFFA873),
                  ),
                  TopCategory(
                    img: 'assets/svg/011-stethoscope.svg',
                    title: 'Sethoscope',
                    color: Color(0XFFD55379),
                  ),
                  TopCategory(
                    img: 'assets/svg/011-stethoscope.svg',
                    title: 'Sethoscope',
                    color: kSecondaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            SectionTitle(title: 'Trending Articles', press: () {},),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5
                  ),
                  child: TrendingArticles(demo: demoItems[index],),
                ),
              )),
            ),
            SizedBox(height: 20,),
            SectionTitle(title: 'Available Doctors', press: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorsList()));}),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                    demoItems.length,
                        (index) => DoctorsCircle(demo: demoItems[index],),
                  )),
            ),
            SizedBox(height: 20,),
            SectionTitle(title: 'What our Users Say', press: () {},),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                    5,
                        (index) => ReviewContainer(),
                  )),
            ),
            SizedBox(height: 20,),
            SectionTitle(title: 'Featured Stories', press: () {},),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                    5,
                        (index) => FeaturedStories(demo: demoItems[index],),
                  )),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
      child: Container(
        height: getProportionateScreenWidth(100),
        width: getProportionateScreenWidth(334),
        decoration: BoxDecoration(
            color: Color(0XFF5554DB),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)
              ),
              height: getProportionateScreenWidth(71),
              width: getProportionateScreenWidth(71),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/joackim-weiler--qnfI8YkTjI-unsplash.jpg'),
                  )
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(200),
                  child: Text(
                    'Medicato has been of great help to my health in General. It helps me keep me maintain my health',
                    softWrap: true,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'Mrs. Adeyemi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(17),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key, @required this.title, @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(12),
        // vertical: getProportionateScreenWidth(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(16)),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              'See more',
              style: TextStyle(
                decoration: TextDecoration.underline,
                  fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}












