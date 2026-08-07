import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/custoum_book_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustoumBookDetails extends StatelessWidget {
  const CustoumBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          const CustoumBookImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Herry Potter and the Goblet of fire',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    'Rubyard Kipling',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        '19.99',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 90),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}