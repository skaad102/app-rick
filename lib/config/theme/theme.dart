import 'package:flutter/material.dart';

class AppTheme {
  final bool isDark;

  AppTheme({this.isDark = false});

  ThemeData getTheme() {
    const seedColor = Color(0xFF00b0c8);

    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: seedColor,
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'ALIVE':
        return Colors.green;
      case 'DEAD':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  AppTheme copyWith({bool? isDark}) {
    return AppTheme(
      isDark: isDark ?? this.isDark,
    );
  }
}
