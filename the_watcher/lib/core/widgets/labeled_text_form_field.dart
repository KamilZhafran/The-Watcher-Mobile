import 'package:flutter/material.dart';

class CustomLabeledTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hint;
  final Function? validator;
  final TextInputType? textInputType;
  final EdgeInsets? contentPadding;
  final String? prefix;
  final TextStyle? labelStyle;
  final bool? obscureText;

  const CustomLabeledTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      this.focusNode,
      this.hint,
      this.validator,
      this.textInputType,
      this.contentPadding,
      this.prefix,
      this.labelStyle,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ??
              const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            focusNode: focusNode,
            obscureText: obscureText ?? false,
            controller: controller,
            keyboardType: textInputType ?? TextInputType.visiblePassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefix: Text(prefix ?? ''),
              contentPadding: contentPadding,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor,
                  width: 2.0,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field harus diisi!';
              }

              if (validator != null) {
                return validator!(value);
              }

              return null;
            },
          ),
        )
      ],
    );
  }
}
