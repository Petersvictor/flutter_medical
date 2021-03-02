import 'package:flutter/material.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/models/user.dart';
import 'package:flutter_medical/services/auth_service.dart';
import 'package:flutter_medical/services/database.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_medical/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ImagePicker _picker = ImagePicker();
  Users user = Users(
    bloodGroup: "",
    name: "",
    address: "",
    height: "",
    weight: "",
    url: "",
    phoneNumber: "",
    diseases: [],
    maps: {},
  );
  bool _light = false;

  _switchFunction(bool value) {
    setState(() {
      _light = value;
    });
  }

  // ignore: missing_return
  _getProfileData() async {
    final String uid = await context.watch<Authentication>().getCurrentUserId();
    await context
        .read<Database>()
        .firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      user.height = value.data()['height'];
      user.url = value.data()['url'];
      user.name = value.data()['name'];
      user.phoneNumber = value.data()['phonenumber'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height:10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.settings, color: Colors.white)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: _getProfileData(),
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: getProportionateScreenWidth(60),
                                  width: getProportionateScreenWidth(60),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(user.url))),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    // SizedBox(height:5),
                                    Text(
                                      user.phoneNumber,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.4)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    Divider(height: 3, thickness: 0.4, color: Colors.black),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileCategories(text: 'Appointments', icon: Icons.event),
                    Divider(),
                    ProfileCategories(
                        text: 'Pills Reminder', icon: Icons.watch),
                    Divider(),
                    ProfileCategories(
                        text: 'Privacy Policy', icon: Icons.stream),
                    Divider(),
                    ProfileCategories(
                        text: 'Help', icon: Icons.note_add_rounded),
                    Divider(),
                    SwitchListTile(
                      title: Text(
                        'Dark Mode',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      value: _light,
                      activeColor: kPrimaryColor,
                      onChanged: _switchFunction,
                      secondary: Container(
                        height: getProportionateScreenWidth(40),
                        width: getProportionateScreenWidth(40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryColor.withOpacity(0.2),
                        ),
                        child: Icon(
                          Icons.lightbulb_outlined,
                          color: kPrimaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                    Divider(),
                    ProfileCategories(text: 'Log Out', icon: Icons.logout),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ProfileCategories extends StatelessWidget {
  const ProfileCategories({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3.75),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kPrimaryColor.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                color: kPrimaryColor,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Spacer(),
          Icon(Icons.navigate_next_outlined)
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getProportionateScreenWidth(50),
          width: getProportionateScreenWidth(50),
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: Icon(
            Icons.account_circle_outlined,
            size: 26,
            color: Colors.white,
          ),
        ),
        Text(
          'Saved \n Doctors',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: kTextColor),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
