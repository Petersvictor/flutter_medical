import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/models/message.dart';
import 'package:flutter_medical/models/user.dart';
import 'package:flutter_medical/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authentication {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User> authStateChanges = FirebaseAuth.instance.authStateChanges();

  Future<User> getCurrentUser() async {
    User currentUser;
      currentUser = _firebaseAuth.currentUser;
      return currentUser;
  }

  Future<Users> getUserDetails() async {
    User currentUser = await getCurrentUser();
    DocumentSnapshot documentSnapshot = await firestore.collection('users').doc(currentUser.uid).get();
    return Users.fromMap(documentSnapshot.data());
  }


  Future getCurrentUserId() async {
    if (_firebaseAuth.currentUser != null) {
      return _firebaseAuth.currentUser.uid;
    }
  }

  Future registerWithEmailAndPassword(
      {String email, password, username, image, phoneNumber}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateUserName(String name, User currentUser) async {
    await currentUser.updateProfile(displayName: name);
    await currentUser.reload();
  }

  Future signInWithEmailAndPassword({String email, String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future resetPass(String email) async {
    try {
      return await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Users>> fetchAllUsers(User currentUser) async {
    List<Users> userList = List<Users>();

    QuerySnapshot querySnapshot = await firestore.collection('users').get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != currentUser.uid) {
        userList.add(Users.fromMap(querySnapshot.docs[i].data()));
      }
    }
    return userList;
  }

  Future<Users> fetchCurrentUserDetails(User currentUser) async {
   Users users = Users();
   DocumentSnapshot documentSnapshot = await firestore.collection('users').doc(currentUser.uid).get();
   users = Users.fromMap(documentSnapshot.data());
   return users;
  }

}
