import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/hometown_colors.dart';

/// Borderless, fully rounded field with a slightly darker yellow fill.
class PillTextField extends StatelessWidget {
  const PillTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      cursorColor: HometownColors.text,
      style: GoogleFonts.quicksand(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: HometownColors.text,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.quicksand(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: HometownColors.hint,
        ),
        errorStyle: GoogleFonts.quicksand(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: HometownColors.error,
        ),
        filled: true,
        fillColor: HometownColors.field,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 17,
        ),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
        focusedErrorBorder: _border,
      ),
    );
  }
}
