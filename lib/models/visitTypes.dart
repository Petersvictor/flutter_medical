import 'package:flutter/material.dart';

class VisitTypes {
  final String title, subTitle, amount;
  final IconData icon;

  VisitTypes({
    this.title,
    this.amount,
    this.subTitle,
    this.icon,
});
}

List <VisitTypes> visits = [visit1, visit2, visit3];

VisitTypes visit1 = VisitTypes(
  title: 'Messaging',
  subTitle: 'can message the doctor',
  amount: '\$5',
  icon: Icons.add,
);

VisitTypes visit2 = VisitTypes(
  title: 'Voice call',
  subTitle: 'can make a voice call with the doctor',
  amount: '\$15',
  icon: Icons.phone,
);

VisitTypes visit3 = VisitTypes(
  title: 'Video Call',
  subTitle: 'can make a video call with the doctor',
  amount: '\$30',
  icon: Icons.video_call_outlined,
);



