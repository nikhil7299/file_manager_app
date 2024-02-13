import 'package:file_manager_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.urbanistTextTheme(ThemeData.dark().textTheme),
          primaryTextTheme:
              GoogleFonts.urbanistTextTheme(ThemeData.dark().primaryTextTheme),
        ),
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.urbanistTextTheme(ThemeData.light().textTheme),
          primaryTextTheme:
              GoogleFonts.urbanistTextTheme(ThemeData.light().primaryTextTheme),
        ),
        home: const HomePage(),
      ),
    );
  }
}
