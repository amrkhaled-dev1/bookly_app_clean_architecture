import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustoumBookRaiting extends StatelessWidget {
  const CustoumBookRaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F)),

        Text(
          '4.8',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(2390)',
          style: GoogleFonts.montserrat(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
