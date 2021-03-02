import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_medical/models/call.dart';
import 'package:flutter_medical/models/user.dart';
import 'package:flutter_medical/screens/call_screen/call_screen.dart';
import 'package:flutter_medical/services/call_methods.dart';

class CallUtilities{

  static final CallMethods callMethods = CallMethods();

  static dial({Users from, Users to, context}) async {

    Call call = Call(
      callerId:  from.uid,
      callerName: from.name,
      callerPic: from.url,
      receiverId:  to.uid,
      receiverName: to.name,
      receiverPic: to.url,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CallScreen(call:call)));
    }
  }


}