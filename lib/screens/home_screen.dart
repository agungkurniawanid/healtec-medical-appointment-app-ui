import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtec_medical_appointment_app/main.dart';
import 'package:healtec_medical_appointment_app/widgets/favourite_doctor_widget.dart';
import 'package:healtec_medical_appointment_app/widgets/home_filter_widget.dart';
import 'package:healtec_medical_appointment_app/widgets/top_doctor_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(systemIconColorProvider.notifier).state = Colors.white;
    });
    final List<Map<String, String>> doctors = [
      {
        'name': "Dr. Esther",
        'image': "assets/doctor4.png",
        'specialist': "Dentist",
        'rating': '4.5',
      },
      {
        'name': "Dr. Warren",
        'image': "assets/doctor3.png",
        'specialist': "Physician",
        'rating': '4.8',
      },
    ];

    final List<Map<String, String>> topDoctors = [
      {
        'name': "Dr. Jenny Wilson",
        'imageUrl': "assets/doctor5.png",
        'specialist': "Neurologist | Vcare Clinic",
        'rating': '4.8',
        'reviews': '(332 Reviews)',
      },
      {
        'name': "Dr. Jenny Wilson",
        'imageUrl': "assets/doctor5.png",
        'specialist': "Neurologist | Vcare Clinic",
        'rating': '4.8',
        'reviews': '(332 Reviews)',
      },
      {
        'name': "Dr. Jenny Wilson",
        'imageUrl': "assets/doctor5.png",
        'specialist': "Neurologist | Vcare Clinic",
        'rating': '4.8',
        'reviews': '(332 Reviews)',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF4C4DDC),
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: -200,
                  child: Transform.scale(
                    scale: 1,
                    child: Image.asset(
                      'assets/texture2.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 1.2,
                    ),
                  ),
                ),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: AssetImage(
                                    'assets/doctor2.png',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Hello, Welcome 🎉',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Savnnah Nguyen',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 34,
                              height: 34,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Image.asset(
                                      'assets/notification-bing-white.png',
                                      width: 34,
                                      height: 34,
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Feather Notification clicked",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    right: 4,
                                    top: 0,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 34),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: GoogleFonts.roboto(
                                color: Colors.grey.shade400,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade400,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.5,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade500,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusColor: Colors.white,
                            ),
                            style: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeFilterWidget(),
                      const SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Favourite Doctor",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.roboto(
                              color: Color(0xFF4C4DDC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                              childAspectRatio: 0.85,
                            ),
                        itemCount: doctors.length,
                        itemBuilder: (_, index) {
                          final doctor = doctors[index];
                          return FavouriteDoctorWidget(
                            name: doctor['name'],
                            image: doctor['image'],
                            specialist: doctor['specialist'],
                            rating: doctor['rating'],
                          );
                        },
                      ),
                      const SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Doctor",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.roboto(
                              color: Color(0xFF4C4DDC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: topDoctors.length,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          final doctor = topDoctors[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: TopDoctorWidget(
                              imageUrl: doctor['imageUrl']!,
                              name: doctor['name']!,
                              specialist: doctor['specialist']!,
                              rating: doctor['rating']!,
                              reviews: doctor['reviews']!,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
