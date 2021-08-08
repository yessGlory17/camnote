import 'package:flutter/material.dart';

class ThemeList {
  static ThemeData get light {
    return ThemeData(
        primaryColor: Colors.white, scaffoldBackgroundColor: Colors.white);
  }

  static ThemeData get dark {
    return ThemeData.dark();
  }

  static ThemeData get Green72E9E0 {
    return ThemeData(
      primaryColor: Color(0xFF72E9E0),
      scaffoldBackgroundColor: Color(0xFF72E9E0),
      bottomAppBarColor: Color(0xFF72E9E0),
    );
  }

  static ThemeData get PinkE08F9A {
    return ThemeData(
      primaryColor: Color(0xFFE08F9A),
      scaffoldBackgroundColor: Color(0xFFE08F9A),
      bottomAppBarColor: Color(0xFFE08F9A),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(unselectedItemColor: Colors.white54),
    );
  }

  static ThemeData get PinkBD7F9D {
    return ThemeData(
      primaryColor: Color(0xFFBD7F9D),
      scaffoldBackgroundColor: Color(0xFFBD7F9D),
      bottomAppBarColor: Color(0xFFBD7F9D),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(unselectedItemColor: Colors.white54),
    );
  }

  static ThemeData get Purple947297 {
    return ThemeData(
      primaryColor: Color(0xFF947297),
      scaffoldBackgroundColor: Color(0xFF947297),
      bottomAppBarColor: Color(0xFF947297),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(unselectedItemColor: Colors.white54),
    );
  }

  static ThemeData get NavyBlue2F4858 {
    return ThemeData(
      primaryColor: Color(0xFF2F4858),
      scaffoldBackgroundColor: Color(0xFF2F4858),
      bottomAppBarColor: Color(0xFF2F4858),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(unselectedItemColor: Colors.white54),
    );
  }

  static ThemeData get Red574144 {
    return ThemeData(
      primaryColor: Color(0xFF574144),
      scaffoldBackgroundColor: Color(0xFF574144),
      bottomAppBarColor: Color(0xFF574144),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(unselectedItemColor: Colors.white54),
    );
  }

  static ThemeData get WhiteFFF3F6 {
    return ThemeData(
      primaryColor: Color(0xFFFFF3F6),
      scaffoldBackgroundColor: Color(0xFFFFF3F6),
      bottomAppBarColor: Color(0xFF5FFF3F6),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey.withOpacity(.8),
      ),
    );
  }

  static ThemeData get Green008076 {
    //bool isActive = false;
    return ThemeData(
      primaryColor: Color(0xFF008076),
      scaffoldBackgroundColor: Color(0xFF008076),
      bottomAppBarColor: Color(0xFF008076),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(unselectedItemColor: Colors.white54),
    );
  }

  static ThemeData get Blue8EA1F3 {
    return ThemeData(
      primaryColor: Color(0xFF8EA1F3),
      scaffoldBackgroundColor: Color(0xFF8EA1F3),
      bottomAppBarColor: Color(0xFF8EA1F3),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(unselectedItemColor: Colors.white54),
    );
  }
}
