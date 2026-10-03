import 'package:bookly_app_clean_architecture/core/router/route_name.dart';
import 'package:bookly_app_clean_architecture/core/widget/custoum_book_image.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({super.key, required this.books});
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteName.kHomeViewDetails);
      },
      child: SizedBox(
        height: 160,
        child: Row(
          children: [
            CustoumBookImage(image: books.image ?? ''),
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
                        books.title,
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      books.authorName ?? '',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Row(
                      children: [
                        Text(
                          'Free',
                          style: GoogleFonts.montserrat(
                            color: Color(0xffFFDD4F),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 90),
                        //const CustoumBookRaiting(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
