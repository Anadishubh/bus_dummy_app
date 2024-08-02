import 'package:flutter/material.dart';
import 'font_constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final int? maxlength;
  final int? maxline;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color color;
  final Color? fillcolor;

  const CustomTextField({
    super.key,
    this.controller,
    this.fillcolor,
    this.labelText,
    this.hintText,
    this.maxlength,
    this.obscureText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.maxline,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: FontConstant.styleMedium(fontSize: 18, color: color),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLength: maxlength ?? 100,
          maxLines: maxline ?? 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillcolor,
            hintText: hintText,
            counterText: "",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.black),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}