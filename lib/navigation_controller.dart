import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healtec_medical_appointment_app/screens/home_screen.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class NavigationController extends ConsumerWidget {
  const NavigationController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    final pages = [HomeScreen(), Container(), Container(), Container()];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              ref,
              index: 0,
              inactiveIcon: FontAwesomeIcons.house,
              activeIcon: FontAwesomeIcons.solidHouse,
              isActive: currentIndex == 0,
            ),
            _buildNavItem(
              context,
              ref,
              index: 1,
              inactiveIcon: FontAwesomeIcons.calendar,
              activeIcon: FontAwesomeIcons.solidCalendar,
              isActive: currentIndex == 1,
            ),
            _buildNavItem(
              context,
              ref,
              index: 2,
              inactiveIcon: FontAwesomeIcons.message,
              activeIcon: FontAwesomeIcons.solidMessage,
              isActive: currentIndex == 2,
            ),
            _buildNavItem(
              context,
              ref,
              index: 3,
              inactiveIcon: FontAwesomeIcons.user,
              activeIcon: FontAwesomeIcons.solidUser,
              isActive: currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    WidgetRef ref, {
    required int index,
    required IconData inactiveIcon,
    required IconData activeIcon,
    required bool isActive,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 300),
              tween: Tween(begin: 1.0, end: isActive ? 1.2 : 1.0),
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: FaIcon(
                isActive ? activeIcon : inactiveIcon,
                color: isActive ? const Color(0xFF4C4DDC) : Colors.grey,
                size: isActive ? 24 : 22,
              ),
            ),
            const SizedBox(height: 8),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isActive ? 6 : 0,
              height: isActive ? 6 : 0,
              decoration: BoxDecoration(
                color: const Color(0xFF4C4DDC),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
