import 'package:flutter/material.dart';

class TimeSlots {
  final String time;

  TimeSlots({
    @required this.time
  });
}

List <TimeSlots> timeSlots = [timeSlots1, timeSlots2, timeSlots3,timeSlots4, timeSlots5, timeSlots6, timeSlots7, timeSlots8];

TimeSlots timeSlots1 = TimeSlots(
    time : "9:00 AM"
);

TimeSlots timeSlots2 = TimeSlots(
    time : "10:00 AM"
);

TimeSlots timeSlots3 = TimeSlots(
    time : "11:00 AM"
);

TimeSlots timeSlots4 = TimeSlots(
    time : "12:00 AM"
);

TimeSlots timeSlots5 = TimeSlots(
    time : "1:00 PM"
);
TimeSlots timeSlots6 = TimeSlots(
    time : "2:00 PM"
);

TimeSlots timeSlots7 = TimeSlots(
    time : "3:00 PM"
);
TimeSlots timeSlots8 = TimeSlots(
    time : "4:00 PM"
);
