import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.ansTxt,
    required this.onTap,
  });

  final String ansTxt;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
          backgroundColor: Colors.green,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
        ),
        onPressed: onTap,
        child: Text(
          ansTxt,
          style: GoogleFonts.aladin(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
