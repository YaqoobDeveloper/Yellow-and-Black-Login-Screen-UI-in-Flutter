import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Fully rounded button with a wide-spaced uppercase label, like "LOGIN".
class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  final String label;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Text(
            label.toUpperCase(),
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.4,
              color: foreground,
            ),
          ),
        ),
      ),
    );
  }
}
