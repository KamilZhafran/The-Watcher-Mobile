import 'dart:io';

import 'package:the_watcher/core/constants.dart';

class Utils {
  static checkFileExtension(File file) {
    final supportedExtensions = ['jpg', 'jpeg', 'png', 'webp'];

    final filePath = file.path;
    final dotIndex = filePath.lastIndexOf('.');
    final fileExtension = filePath.substring(dotIndex + 1);

    return supportedExtensions.contains(fileExtension);
  }

  static showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg.replaceAll('Exception: ', ''),
        ),
      ),
    );
  }
}
