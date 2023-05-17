import 'package:the_watcher/core/constants.dart';

final appTheme = ThemeData.light().copyWith(
    primaryColor: CustomColor.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColor.primaryColor),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: CustomColor.primaryColor,
      cursorColor: CustomColor.primaryColor,
      selectionHandleColor: CustomColor.primaryColor,
    ));
