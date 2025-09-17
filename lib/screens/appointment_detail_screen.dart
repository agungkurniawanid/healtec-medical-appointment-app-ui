import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtec_medical_appointment_app/widgets/favourite_doctor_widget.dart';

class AppointmentDetailScreen extends ConsumerWidget {
  const AppointmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> experienceBadge = [
      {
        "icon": FontAwesomeIcons.peopleGroup,
        "count": "120+",
        "experience": "Patients",
      },
      {
        "icon": FontAwesomeIcons.chartSimple,
        "count": "7+",
        "experience": "Years Exp",
      },
      {
        "icon": FontAwesomeIcons.solidStar,
        "count": "4.9",
        "experience": "Rating",
      },
      {
        "icon": FontAwesomeIcons.solidMessage,
        "count": "100+",
        "experience": "Reviews",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.angleLeft),
                  const Spacer(),
                  Text(
                    "My Appointment",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 32.0),
              const FavouriteDoctorWidget(
                image: "assets/doctor4.png",
                reviews: "(332 Reviews)",
              ),
              const SizedBox(height: 32),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.7,
                ),
                itemCount: experienceBadge.length,
                itemBuilder: (_, index) {
                  final experienceBadges = experienceBadge[index];
                  return buildExperience(
                    icon: experienceBadges["icon"],
                    count: experienceBadges["count"],
                    experience: experienceBadges["experience"],
                  );
                },
              ),
              const SizedBox(height: 32),
              buildAbout(context),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4C4DDC),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.phone,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Voice Call (14.30 - 15.00 PM)',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildExperience({IconData? icon, String? count, String? experience}) {
  return Container(
    // Added container to constrain height
    constraints: const BoxConstraints(maxHeight: 120),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEDFC).withOpacity(0.6),
            borderRadius: BorderRadius.circular(100),
          ),
          child: FaIcon(
            icon ?? FontAwesomeIcons.peopleGroup,
            color: const Color(0xFF4C4DDC),
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          count ?? "120+",
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          experience ?? "Patients",
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF939393),
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget buildAbout(BuildContext context) {
  final String fullDescription =
      "Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. She has over 15 years of experience in immunology and has published numerous research papers in prestigious medical journals. Dr. Angel completed her medical degree at Harvard Medical School and her residency at Johns Hopkins Hospital. She specializes in autoimmune diseases, allergies, and immunodeficiency disorders. Patients appreciate her compassionate approach and thorough explanations of complex medical conditions.";

  return _AboutSection(fullDescription: fullDescription);
}

class _AboutSection extends StatefulWidget {
  final String fullDescription;

  const _AboutSection({required this.fullDescription});

  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<_AboutSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              final textSpan = TextSpan(
                text: widget.fullDescription,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              );

              final textPainter = TextPainter(
                text: textSpan,
                maxLines: 2,
                textDirection: TextDirection.ltr,
              );

              textPainter.layout(maxWidth: constraints.maxWidth);

              if (textPainter.didExceedMaxLines) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: Text(
                        widget.fullDescription,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      secondChild: Text(
                        widget.fullDescription,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? "Read Less" : "Read More",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4C4DDC),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Text(
                  widget.fullDescription,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
