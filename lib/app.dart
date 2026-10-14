import 'package:flutter/material.dart';

import 'screens/hometown_login_screen.dart';
import 'theme/hometown_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hometown',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: HometownColors.yellow,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: HometownColors.dark,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: HometownColors.dark.withValues(alpha: 0.2),
          selectionHandleColor: HometownColors.dark,
        ),
        // No Material ripple, highlight or hover anywhere in the app.
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const HometownLoginScreen(),
    );
  }
}
