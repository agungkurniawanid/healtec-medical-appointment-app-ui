import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:healtec_medical_appointment_app/screens/onboarding_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final systemIconColorProvider = StateProvider<Color>((ref) => Colors.black);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = ref.watch(systemIconColorProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateSystemUI(iconColor);
    });

    return MaterialApp(
      title: 'Healtec - Medical Appointment App',
      debugShowCheckedModeBanner: false,
      home: OnboardingAScreen(),
    );
  }
}

void updateSystemUI(Color iconColor) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: iconColor == Colors.white
          ? Brightness.light
          : Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
}
