import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/models/call.dart';
import 'package:flutter_medical/models/user.dart';

class CallMethods {

  final CollectionReference callCollection = FirebaseFirestore.instance.collection('calls');
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Stream<DocumentSnapshot> callStream({String uid}) {
    callCollection.doc(uid).snapshots();
  }

  Future<bool> makeCall({Call call}) async {
    try {
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      Map<String, dynamic> hasNotDialled = call.toMap(call);

      await callCollection.doc(call.callerId).set(hasDialledMap);
      await callCollection.doc(call.receiverId).set(hasNotDialled);
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({Call call}) async {
    try {
      await callCollection.doc(call.callerId).delete();
      await callCollection.doc(call.receiverId).delete();
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  Future<Users> getUserDetailsofuid({String uid}) async {
    DocumentSnapshot documentSnapshot = await usersCollection.doc(uid).get();
    return Users.fromMap(documentSnapshot.data());
  }

}