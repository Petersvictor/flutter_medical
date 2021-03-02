import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_medical/models/message.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'file:///C:/Users/Peters/AndroidStudioProjects/flutter_medical/lib/provider/image_upload_provider.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference _reference;

  Future<void> addMessageToDb(
      Message message,
      ) async {
    var map = message.toMap();

        await firestore.collection('messages')
            .doc(message.senderId)
            .collection(message.receiverId)
            .add(map);

        return await firestore.collection('messages')
            .doc(message.receiverId)
            .collection(message.senderId)
            .add(map);
    }
    Future<String> uploadImageToStorage(image) async {
    try {
      Message message;
      _reference = storage.ref().child('${DateTime.now().millisecondsSinceEpoch}');
      var _uploadTask = _reference.putFile(image);
      var url = await (await _uploadTask).ref.getDownloadURL();
      print(url.toString());
      return url;
    } catch(e) {
      print(e);
      return null;
    }
    }

    void setImageMessage(String url, receiverId, senderId) async {
      Message _message;

      _message = Message.imageMessage(
        message: 'IMAGE',
        receiverId: receiverId,
        senderId: senderId,
        photoUrl: url,
        type: 'image',
        timestamp: Timestamp.now()
      );

      var map = _message.toImageMap();

      await firestore.collection('messages')
          .doc(_message.senderId)
          .collection(_message.receiverId)
          .add(map);

      await firestore.collection('messages')
          .doc(_message.receiverId)
          .collection(_message.senderId)
          .add(map);
    }

    void uploadImage({
      @required File image,
      @required String senderId,
      @required String receiverId,
      @required ImageUploadProvider imageUploadProvider,
    }) async {

    imageUploadProvider.setToLoading();
       String url = await uploadImageToStorage(image);

       imageUploadProvider.setToIdle();

       setImageMessage(url, receiverId, senderId);
    }

    // void uploadImage({@required PickedFile image, @required String senderId, @required receiverId}) {
    // }
  }