import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/models/session_details.dart';
import 'package:flutter_medical/models/time_slots.dart';
import 'package:flutter_medical/models/visitTypes.dart';
import 'package:flutter_medical/size_config.dart';
import 'package:flutter_medical/screens/appointment_flow/appointment_details/appointment_detail.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DatePickerController _dateController = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  int selectedIndex;
  int timeIndexSelector;
  final newSessionDetails = SessionDetails('', '', '', null, '', '');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 100,
                  controller: _dateController,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: kSecondaryColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    setState(() {
                      newSessionDetails.date = date;
                    });
                  },
                ),
              ),
              Divider(),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  'Time Slots',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: 120,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 10.0, mainAxisSpacing: 15.0,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4),),
                    itemCount: timeSlots.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TimeSelector(
                        timeSlots: timeSlots[index],
                        containerColor: timeIndexSelector == index ? kSecondaryColor : Colors.white,
                        textColor: timeIndexSelector == index ? Colors.white : Colors.black,
                        press: () {
                          setState(() {
                            timeIndexSelector = index;
                            newSessionDetails.time = timeSlots[index].time;
                          });
                        },
                      );
                    },
                ),
              ),
             Text(newSessionDetails.time),
              Divider(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  'Visit Type and Fees',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  ...List.generate(
                    visits.length,
                    (index) {
                      return VisitTypeFees(
                        visitTypes: visits[index],
                        amountColor: selectedIndex == index ? Colors.white : kPrimaryColor,
                        subTitleColor: selectedIndex == index ? Colors.white : kTextColor,
                        titleColor: selectedIndex == index ? Colors.white : Colors.black,
                        iconColor: selectedIndex == index ? kSecondaryColor : kPrimaryColor,
                        lilConColor: selectedIndex == index ? Colors.white : kPrimaryLightColor.withOpacity(0.6),
                        color: selectedIndex == index  ? kSecondaryColor : Colors.white,
                        press: () {
                          setState(() {
                            selectedIndex = index;
                            newSessionDetails.type = visits[index].title;
                          });
                        },
                      );
                    })
                ],
              ),
              Text(newSessionDetails.type),
              Text(newSessionDetails.date.toString()),
              SizedBox(height: 20),
              // Spacer(),
              InkWell(
                onTap: () {
                  _selectedValue = newSessionDetails.date;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDetail(sessionDetails: newSessionDetails,)));
                },
                child: Container(
                  height: getProportionateScreenHeight(55),
                  width: SizeConfig.screenWidth - 20,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:  getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  const TimeSelector({
    Key key,  this.isSelected = false, this.press, this.textColor, this.containerColor, this.timeSlots,
  }) : super(key: key);

  final bool isSelected;
  final GestureTapCallback press;
  final Color textColor, containerColor;
  final TimeSlots timeSlots;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(3)
        ),
        child: Center(
          child: Text(
            timeSlots.time,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(13),
              fontWeight: FontWeight.w500 ,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}




