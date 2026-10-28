import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// CineTrack Design System Theme Tokens & ThemeData
/// Inspired by the Pulse Cinema aesthetic: obsidian dark surfaces, electric cyan primary accents,
/// warm golden ratings, and crisp typography using Plus Jakarta Sans.
class AppTheme {
  AppTheme._();

  // ==========================================
  // BRAND COLOR PALETTE
  // ==========================================
  // Electric Cyan Accents & Primaries
  static const Color cyanPrimary = Color(0xFF00E5FF);
  static const Color cyanPrimaryContainer = Color(0xFF00B4D8);
  static const Color cyanOnPrimary = Color(0xFF00363D);

  // Ratings & Accents
  static const Color goldAccent = Color(0xFFFFB703);
  static const Color amberRating = Color(0xFFFFC107);
  static const Color greenScore = Color(0xFF00E676);

  // Dark Palette (Obsidian / Pulse Cinema)
  static const Color darkSurfaceContainerLowest = Color(0xFF0B0E14);
  static const Color darkSurface = Color(0xFF10131A);
  static const Color darkSurfaceDim = Color(0xFF10131A);
  static const Color darkSurfaceContainerLow = Color(0xFF191C22);
  static const Color darkSurfaceContainer = Color(0xFF1E222A);
  static const Color darkSurfaceContainerHigh = Color(0xFF282C35);
  static const Color darkSurfaceContainerHighest = Color(0xFF333842);
  static const Color darkSurfaceBright = Color(0xFF363940);
  static const Color darkOnSurface = Color(0xFFF1F3F9);
  static const Color darkOnSurfaceVariant = Color(0xFF9DA3AF);
  static const Color darkOutline = Color(0xFF4B5563);
  static const Color darkOutlineVariant = Color(0xFF262A34);

  // Light Palette (Clean, high-contrast studio mode)
  static const Color lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F9FC);
  static const Color lightSurfaceDim = Color(0xFFEBEDF2);
  static const Color lightSurfaceContainerLow = Color(0xFFF2F4F8);
  static const Color lightSurfaceContainer = Color(0xFFEAEDF3);
  static const Color lightSurfaceContainerHigh = Color(0xFFE2E6ED);
  static const Color lightSurfaceContainerHighest = Color(0xFFD9DEE6);
  static const Color lightSurfaceBright = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF0E131F);
  static const Color lightOnSurfaceVariant = Color(0xFF5B6474);
  static const Color lightOutline = Color(0xFFB0B7C3);
  static const Color lightOutlineVariant = Color(0xFFE0E4EC);

  // ==========================================
  // DARK THEME (Pulse Cinema - Default)
  // ==========================================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkSurfaceContainerLowest,
      canvasColor: darkSurface,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: cyanPrimary,
        onPrimary: darkSurfaceContainerLowest,
        primaryContainer: cyanPrimaryContainer,
        onPrimaryContainer: Colors.white,
        secondary: goldAccent,
        onSecondary: Colors.black,
        tertiary: greenScore,
        surface: darkSurface,
        onSurface: darkOnSurface,
        surfaceContainerLowest: darkSurfaceContainerLowest,
        surfaceContainerLow: darkSurfaceContainerLow,
        surfaceContainer: darkSurfaceContainer,
        surfaceContainerHigh: darkSurfaceContainerHigh,
        surfaceContainerHighest: darkSurfaceContainerHighest,
        outline: darkOutline,
        outlineVariant: darkOutlineVariant,
        error: Color(0xFFFF5252),
        onError: Colors.white,
      ),
      // Typography (Plus Jakarta Sans)
      textTheme: TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: darkOnSurface,
          letterSpacing: -0.5,
        ),
        headlineLarge: GoogleFonts.plusJakartaSans(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: darkOnSurface,
          letterSpacing: -0.4,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: darkOnSurface,
          letterSpacing: -0.2,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: darkOnSurface,
        ),
        titleMedium: GoogleFonts.plusJakartaSans(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: darkOnSurface,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: darkOnSurface,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: darkOnSurface,
          height: 1.4,
        ),
        labelLarge: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
        labelSmall: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: darkOnSurface,
        ),
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: darkSurfaceContainerLowest.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: darkOnSurface),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: cyanPrimary,
          letterSpacing: -0.3,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: darkSurfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: darkOutlineVariant, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),

      // Elevated Button (Cyan Primary Pill)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cyanPrimary,
          foregroundColor: darkSurfaceContainerLowest,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // Outlined Button (Dark border)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkOnSurface,
          backgroundColor: darkSurfaceContainerLow,
          side: const BorderSide(color: darkOutlineVariant, width: 1),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Chips (Filter & Genre pills)
      chipTheme: ChipThemeData(
        backgroundColor: darkSurfaceContainerLow,
        selectedColor: cyanPrimary,
        secondarySelectedColor: cyanPrimary,
        labelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: darkOnSurface,
        ),
        secondaryLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: darkSurfaceContainerLowest,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: darkOutlineVariant, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkSurfaceContainerLowest.withValues(alpha: 0.95),
        selectedItemColor: cyanPrimary,
        unselectedItemColor: darkOnSurfaceVariant,
        selectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 16,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: darkOutlineVariant,
        thickness: 1,
        space: 1,
      ),
    );
  }

  // ==========================================
  // LIGHT THEME (Studio Cinema Mode)
  // ==========================================
  // static ThemeData get lightTheme {
  //   final baseTextTheme = GoogleFonts.plusJakartaSansTextTheme(ThemeData.dark().textTheme );

  //   return ThemeData(
  //     useMaterial3: true,
  //     brightness: Brightness.light,
  //     scaffoldBackgroundColor: lightSurface,
  //     canvasColor: lightSurfaceContainerLowest,

  //     // Color Scheme
  //     colorScheme: const ColorScheme.light(
  //       primary: Color(0xFF0091A8), // High-contrast cyan/teal for light mode readability
  //       onPrimary: Colors.white,
  //       primaryContainer: Color(0xFFD6F8FF),
  //       onPrimaryContainer: Color(0xFF003740),
  //       secondary: Color(0xFFE59400),
  //       onSecondary: Colors.white,
  //       tertiary: Color(0xFF008744),
  //       surface: lightSurfaceContainerLowest,
  //       onSurface: lightOnSurface,
  //       surfaceContainerLowest: lightSurfaceContainerLowest,
  //       surfaceContainerLow: lightSurfaceContainerLow,
  //       surfaceContainer: lightSurfaceContainer,
  //       surfaceContainerHigh: lightSurfaceContainerHigh,
  //       surfaceContainerHighest: lightSurfaceContainerHighest,
  //       outline: lightOutline,
  //       outlineVariant: lightOutlineVariant,
  //       error: Color(0xFFD32F2F),
  //       onError: Colors.white,
  //     ),

  //     // Typography
  //     textTheme: baseTextTheme.copyWith(
  //       displayLarge: GoogleFonts.plusJakartaSans(
  //         fontSize: 34,
  //         fontWeight: FontWeight.w800,
  //         color: lightOnSurface,
  //         letterSpacing: -0.5,
  //       ),
  //       headlineLarge: GoogleFonts.plusJakartaSans(
  //         fontSize: 26,
  //         fontWeight: FontWeight.w700,
  //         color: lightOnSurface,
  //         letterSpacing: -0.4,
  //       ),
  //       headlineMedium: GoogleFonts.plusJakartaSans(
  //         fontSize: 20,
  //         fontWeight: FontWeight.w700,
  //         color: lightOnSurface,
  //         letterSpacing: -0.2,
  //       ),
  //       titleLarge: GoogleFonts.plusJakartaSans(
  //         fontSize: 18,
  //         fontWeight: FontWeight.w600,
  //         color: lightOnSurface,
  //       ),
  //       titleMedium: GoogleFonts.plusJakartaSans(
  //         fontSize: 15,
  //         fontWeight: FontWeight.w600,
  //         color: lightOnSurface,
  //       ),
  //       bodyLarge: GoogleFonts.plusJakartaSans(
  //         fontSize: 15,
  //         fontWeight: FontWeight.w400,
  //         color: lightOnSurfaceVariant,
  //         height: 1.5,
  //       ),
  //       bodyMedium: GoogleFonts.plusJakartaSans(
  //         fontSize: 13,
  //         fontWeight: FontWeight.w400,
  //         color: lightOnSurfaceVariant,
  //         height: 1.4,
  //       ),
  //       labelLarge: GoogleFonts.plusJakartaSans(
  //         fontSize: 13,
  //         fontWeight: FontWeight.w700,
  //         letterSpacing: 0.2,
  //       ),
  //       labelSmall: GoogleFonts.plusJakartaSans(
  //         fontSize: 11,
  //         fontWeight: FontWeight.w600,
  //         color: lightOnSurfaceVariant,
  //       ),
  //     ),

  //     // AppBar
  //     appBarTheme: AppBarTheme(
  //       backgroundColor: lightSurfaceContainerLowest.withValues(alpha: 0.9),
  //       elevation: 0,
  //       scrolledUnderElevation: 0,
  //       centerTitle: false,
  //       iconTheme: const IconThemeData(color: lightOnSurface),
  //       titleTextStyle: GoogleFonts.plusJakartaSans(
  //         fontSize: 20,
  //         fontWeight: FontWeight.w800,
  //         color: const Color(0xFF0091A8),
  //         letterSpacing: -0.3,
  //       ),
  //     ),

  //     // Card Theme
  //     cardTheme: CardTheme(
  //       color: lightSurfaceContainerLowest,
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16),
  //         side: const BorderSide(color: lightOutlineVariant, width: 1),
  //       ),
  //       margin: EdgeInsets.zero,
  //     ),

  //     // Elevated Button
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: const Color(0xFF0091A8),
  //         foregroundColor: Colors.white,
  //         elevation: 0,
  //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         textStyle: GoogleFonts.plusJakartaSans(
  //           fontSize: 14,
  //           fontWeight: FontWeight.w700,
  //         ),
  //       ),
  //     ),

  //     // Outlined Button
  //     outlinedButtonTheme: OutlinedButtonThemeData(
  //       style: OutlinedButton.styleFrom(
  //         foregroundColor: lightOnSurface,
  //         backgroundColor: lightSurfaceContainerLow,
  //         side: const BorderSide(color: lightOutlineVariant, width: 1),
  //         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         textStyle: GoogleFonts.plusJakartaSans(
  //           fontSize: 14,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ),

  //     // Chips
  //     chipTheme: ChipThemeData(
  //       backgroundColor: lightSurfaceContainerLow,
  //       selectedColor: const Color(0xFF0091A8),
  //       secondarySelectedColor: const Color(0xFF0091A8),
  //       labelStyle: GoogleFonts.plusJakartaSans(
  //         fontSize: 12,
  //         fontWeight: FontWeight.w600,
  //         color: lightOnSurface,
  //       ),
  //       secondaryLabelStyle: GoogleFonts.plusJakartaSans(
  //         fontSize: 12,
  //         fontWeight: FontWeight.w700,
  //         color: Colors.white,
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         side: const BorderSide(color: lightOutlineVariant, width: 1),
  //       ),
  //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //     ),

  //     // Bottom Navigation Bar
  //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       backgroundColor: lightSurfaceContainerLowest.withValues(alpha: 0.95),
  //       selectedItemColor: const Color(0xFF0091A8),
  //       unselectedItemColor: lightOnSurfaceVariant,
  //       selectedLabelStyle: GoogleFonts.plusJakartaSans(
  //         fontSize: 11,
  //         fontWeight: FontWeight.w700,
  //       ),
  //       unselectedLabelStyle: GoogleFonts.plusJakartaSans(
  //         fontSize: 11,
  //         fontWeight: FontWeight.w500,
  //       ),
  //       type: BottomNavigationBarType.fixed,
  //       elevation: 8,
  //     ),

  //     // Divider Theme
  //     dividerTheme: const DividerThemeData(
  //       color: lightOutlineVariant,
  //       thickness: 1,
  //       space: 1,
  //     ),
  //   );
  // }
}
