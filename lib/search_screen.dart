import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Peters/AndroidStudioProjects/flutter_medical/lib/screens/chat_screen/chat_screen.dart';
import 'package:flutter_medical/models/user.dart';
import 'package:flutter_medical/screens/call_screen/pickup/pickup_layout.dart';
import 'package:flutter_medical/screens/login/login_screen.dart';
import 'package:flutter_medical/services/auth_service.dart';
import 'package:flutter_medical/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Authentication _authentication = Authentication();
  List<Users> userList;
  String query= "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authentication.getCurrentUser().then((User user) {
      _authentication.fetchAllUsers(user).then((List<Users> list) {
        setState(() {
          userList = list;
        });
      });
    });
  }


  buildSuggestions() {
    final List<Users> suggestionList = userList !=null ? userList : [];
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        Users searchedUser = Users(
            uid: suggestionList[index].uid,
            url: suggestionList[index].url,
            name: suggestionList[index].name,
            address: suggestionList[index].address,
        );
        return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(
                receiver:searchedUser
              )));
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
                                image: NetworkImage(searchedUser.url)
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
                        searchedUser.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(16)
                        ),
                      ),
                      Text(
                        searchedUser.address,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: SizeConfig.screenWidth,
                color: kPrimaryColor,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Doctors, Clinics...',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Colors.white.withOpacity(0.8)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.search,
                      size: getProportionateScreenWidth(20),
                      color: Colors.white,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(5)),
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(5)),
                        borderSide: BorderSide(color: kSecondaryColor),
                        gapPadding: 10),
                  ),
                ),
              ),
              Container(
                color: kSecondaryColor,
                height: 100,
                width: double.infinity,
                child: FlatButton(
                  onPressed: () async {
                    await _authentication.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'LogOut'
                  ),
                ),
              ),
              Expanded(
                child: buildSuggestions(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
