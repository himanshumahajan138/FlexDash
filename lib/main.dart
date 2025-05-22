import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(const FlexDashApp());

class FlexDashApp extends StatefulWidget {
  const FlexDashApp({super.key});

  @override
  State<FlexDashApp> createState() => _FlexDashAppState();
}

class _FlexDashAppState extends State<FlexDashApp> {
  bool _isDarkMode = false;
  MaterialColor _primarySwatch = Colors.blue;

  void _updateDarkMode(bool isDark) {
    setState(() => _isDarkMode = isDark);
  }

  void _updatePrimarySwatch(MaterialColor color) {
    setState(() => _primarySwatch = color);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexDash',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const HomeScreenMain(),
            );
          case '/details':
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const DetailScreen(),
            );
          case '/settings':
            return MaterialPageRoute(
              settings: settings,
              builder:
                  (_) => SettingsScreen(
                    isDarkMode: _isDarkMode,
                    primarySwatch: _primarySwatch,
                    onDarkModeChanged: _updateDarkMode,
                    onPrimarySwatchChanged: _updatePrimarySwatch,
                  ),
            );
          default:
            return null;
        }
      },
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final base = ThemeData(
      brightness: brightness,
      primarySwatch: _primarySwatch,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _primarySwatch,
        brightness: brightness,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: brightness).textTheme,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primarySwatch,
          foregroundColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      cardTheme: CardTheme(
        color:
            brightness == Brightness.dark
                ? _primarySwatch.shade700
                : _primarySwatch.shade100,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
      ),
    );
    return base;
  }
}
