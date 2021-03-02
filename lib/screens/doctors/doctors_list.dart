import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_medical/components/custom_nav_bar.dart';
import 'package:flutter_medical/provider/user_provider.dart';
import 'package:flutter_medical/screens/call_screen/pickup/pickup_layout.dart';
import 'package:flutter_medical/screens/doctors/components/body.dart';
import 'package:flutter_medical/size_config.dart';
import 'package:provider/provider.dart';


class DoctorsList extends StatefulWidget {
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {

  UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      userProvider= Provider.of<UserProvider>(context, listen: false);
      userProvider.refreshUser();
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PickupLayout(
      scaffold: Scaffold(
        body: Body(),
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}
