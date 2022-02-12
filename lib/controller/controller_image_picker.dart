import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ControllerImagePicker {
  static Future<File?> imagePick({required ImageSource source}) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image =
          await picker.pickImage(source: source, imageQuality: 50);
      log(source.index.toString());
      if (image == null) {
        return null;
      } else {
        return File(image.path);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<List<File>?> imagePickList(
      {required ImageSource source}) async {
    try {
      final List<File> listImage = [];
      final ImagePicker picker = ImagePicker();
      final List<XFile>? image = await picker.pickMultiImage(imageQuality: 50);

      if (image == null || image.isEmpty) {
        return null;
      } else {
        for (var element in image) {
          listImage.add(
            File(element.path),
          );
        }
        return listImage;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
