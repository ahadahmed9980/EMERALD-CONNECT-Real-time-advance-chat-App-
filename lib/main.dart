import 'package:emberald/route/approutes.dart';
import 'package:emberald/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}
//height 914
//width 411
// SizedBox(height: size.height * 0.01), // ~9 px
// SizedBox(height: size.height * 0.08), // for space between button and next
// SizedBox(height: size.height * 0.018), // ~16 px
// SizedBox(height: size.height * 0.026), // ~24 px
// SizedBox(height: size.height * 0.035), // ~32 px

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Emerald Connect',
      routerConfig: appRouters,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ).copyWith(primary: AppColors.primary, onPrimary: AppColors.onprimary),
        textTheme: GoogleFonts.poppinsTextTheme(
          // Apni marzi ka font name (e.g., Roboto, Lato, Inter)
          const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            displayMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: TextStyle(fontSize: 18, height: 1.5),
            bodyMedium: TextStyle(
              fontSize: 18,
              height: 1.2,
              color: AppColors.textSecondary,
            ),
            labelLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 0, // Shadow hatana
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // M3 mein zyada round
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        
      ),
    );
  }
}
