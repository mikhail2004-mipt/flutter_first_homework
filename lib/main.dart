import 'package:flutter/material.dart';
import 'screens/news_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            theme: themeNotifier.getTheme(),
            darkTheme: themeNotifier.getDarkTheme(),
            themeMode: themeNotifier.getThemeMode(),
            home: NewsListScreen(),
          );
        },
      ),
    );
  }
}

class ThemeNotifier with ChangeNotifier {
  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();
  ThemeMode _themeMode = ThemeMode.light;

  ThemeData getTheme() => _lightTheme;
  ThemeData getDarkTheme() => _darkTheme;
  ThemeMode getThemeMode() => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}