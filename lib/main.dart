import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'services/progresso_service.dart';
import 'screens/home_screen.dart';

final ValueNotifier<ThemeMode> lumeThemeNotifier = ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedMode = await ProgressoService.obterThemeMode();
  lumeThemeNotifier.value = savedMode;
  runApp(const LumeApp());
}

class LumeApp extends StatelessWidget {
  const LumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: lumeThemeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'Lume — Plataforma de Estudos',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}
