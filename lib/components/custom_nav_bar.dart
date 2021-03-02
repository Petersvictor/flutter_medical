import 'package:flutter/material.dart';
import 'package:flutter_medical/screens/doctor_details/doctors_details.dart';
import 'package:flutter_medical/screens/home/home_screen.dart';
import 'package:flutter_medical/screens/profile/profile_screen.dart';
import 'package:flutter_medical/screens/upgrade_to_pro/upgrade_pro.dart';
import 'package:flutter_medical/search_screen.dart';
import '../constants.dart';
import '../size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedMenu;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> splashData = [
      {
        "icon": FontAwesomeIcons.home,
        "title": "Home",
      },
      {
        "icon": FontAwesomeIcons.commentDots,
        "title": "Inbox",
      },
      {
        "icon": FontAwesomeIcons.bookmark,
        "title": "Saved",
      },
      {
        "icon": FontAwesomeIcons.search,
        "title": "Search",
      },
      {
        "icon": FontAwesomeIcons.user,
        "title": "Profile",
      },
    ];

    SizeConfig().init(context);
    return Container(
      height: getProportionateScreenWidth(60),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
          offset: Offset(0, 0),
        blurRadius: 3,
        color: Colors.black.withOpacity(0.3)
    ),
        ]
      ),
      child: SafeArea(
        child: Padding(
          padding:
          EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            // vertical: getProportionateScreenWidth(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                splashData.length,
                  (index) {
                  return NavItem(
                    icon: splashData[index]['icon'],
                    title: splashData[index]['title'],
                    iconColor: selectedMenu == index ? Colors.white : kAshColor,
                    containerColor: selectedMenu == index ? kPrimaryColor : Colors.transparent,
                    textColor: selectedMenu == index ? Colors.white : kAshColor,
                    press: () {
                      setState(() {
                        selectedMenu = index;
                      });
                      if(selectedMenu ==0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      } else if (selectedMenu == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                      } else if (selectedMenu == 2) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UpgradeToPro()));
                      } else if (selectedMenu == 3) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorsDetails()));
                      } else if (selectedMenu == 4) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                      }
                    }
                  );
                  }
              )
            ],
          )
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.press,
    this.isActive = false, this.iconColor, this.containerColor, this.textColor,
  }) : super(key: key);
  final String title;
  final GestureTapCallback press;
  final bool isActive;
  final Color iconColor, containerColor, textColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: getProportionateScreenWidth(60),
        width: getProportionateScreenWidth(70),
        color: containerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: getProportionateScreenWidth(15),
              color: iconColor,
            ),
            SizedBox(height: getProportionateScreenWidth(5),),
            Text(
              title,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}