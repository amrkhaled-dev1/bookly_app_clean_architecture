import 'package:bookly_app_clean_architecture/core/widget/custoum_text_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Expanded(
            child: CustoumTextButton(
              backgroundColor: Colors.white,
              text: 'Free',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              textStyle: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: CustoumTextButton(
              onPressed: () {},
              backgroundColor: Color(0xffEF8262),
              text: 'Preview',
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
