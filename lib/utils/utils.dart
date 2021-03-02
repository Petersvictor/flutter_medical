import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class Utils {


  static Future<File> pickImage({@required File selectedImage}) async  {
    return await compressImage(selectedImage);
  }

  // ignore: missing_return
  static Future<File> compressImage(File imageToCompress) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = Random().nextInt(10000);

  }
}