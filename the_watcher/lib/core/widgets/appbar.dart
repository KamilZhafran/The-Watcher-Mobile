import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: non_constant_identifier_names
class CustomAppbar {
  static PreferredSizeWidget standard(
      {required String title, List<Widget>? actions}) {
    return AppBar(
      title: Text(
        title,
        maxLines: 1,
      ),
      actions: actions,
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
  }

  static PreferredSizeWidget transparent(
      {String? title, List<Widget>? actions}) {
    return AppBar(
      title: Text(
        title ?? '',
        maxLines: 1,
      ),
      actions: actions,
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
  }
}
