import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_medical/services/auth_service.dart';

class Storage {
  FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://medical-d5c7e.appspot.com');


  Authentication _authentication = Authentication();


  // ignore: missing_return
  Future<String> uploadFile(file) async {
    var uid = await _authentication.getCurrentUserId();
    var storageRef = storage.ref().child("users/${uid}");
    var uploadTask = storageRef.putFile(file);
    await uploadTask.whenComplete(()  {
      downloadURL();
    });
  }

  Future<String> downloadURL() async {
    var uid = await _authentication.getCurrentUserId();
     String downloadURL = await FirebaseStorage.instance
        .ref("users/${uid}")
        .getDownloadURL();
    return downloadURL;
  }
}