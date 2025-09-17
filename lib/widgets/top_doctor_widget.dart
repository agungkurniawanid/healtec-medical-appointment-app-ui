import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TopDoctorWidget extends ConsumerWidget {
  final String? imageUrl, name, specialist, rating, reviews;
  const TopDoctorWidget({
    super.key,
    this.imageUrl,
    this.name,
    this.specialist,
    this.rating,
    this.reviews,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF101010).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 30,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                child: Image.asset(imageUrl ?? 'assets/doctor5.png'),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? "Dr. Jenny Wilson",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                specialist ?? "Nurologist | Vcare Clinic",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amberAccent,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    rating ?? "4.8",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    reviews ?? "(332 reviews)",
                    style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          FaIcon(FontAwesomeIcons.ellipsis, color: Colors.grey),
        ],
      ),
    );
  }
}
