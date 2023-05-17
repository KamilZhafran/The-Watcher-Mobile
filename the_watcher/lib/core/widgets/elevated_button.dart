import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? bgColor;
  final Color? textColor;
  final double? elevation;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? width;
  final double? height;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.padding,
      this.borderRadius,
      this.bgColor,
      this.textColor,
      this.elevation,
      this.fontWeight,
      this.fontSize,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(
              bgColor ?? Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all<EdgeInsets>(
              padding ?? const EdgeInsets.all(16)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
