import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeFilterWidget extends ConsumerStatefulWidget {
  const HomeFilterWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeFilterWidgetState();
}

class _HomeFilterWidgetState extends ConsumerState<HomeFilterWidget> {
  final List<String> categories = [
    '🔥 All',
    '🤒 Fever',
    '😷 Cough',
    '🤢 Nauseated',
    '🤧 Cold',
    '🤮 Vomit',
    '🤕 Headache',
    '🤯 Migraine',
    '🤒 Flu',
    '🦠 Infection',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            children: List.generate(categories.length, (index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: categoryItem(categories[index], isSelected),
              );
            }),
          ),
        ),
      ),
    );
  }
}

Widget categoryItem(String text, bool isSelected) => Padding(
  padding: const EdgeInsets.only(right: 8.0),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: isSelected
          ? const Color(0xFF4C4DDC)
          : const Color(0xFFEDEDFC).withOpacity(0.8),
      borderRadius: BorderRadius.circular(8),
      boxShadow: isSelected
          ? [
              BoxShadow(
                color: const Color(0xFF4C4DDC).withOpacity(0.6),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]
          : null,
    ),
    child: Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 16,
        color: isSelected
            ? Colors.white
            : const Color.fromARGB(255, 98, 100, 100),
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
