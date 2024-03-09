import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  try {
    final XFile? xFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return null;
    return File(xFile.path);
  } catch (e) {
    return null;
  }
}
