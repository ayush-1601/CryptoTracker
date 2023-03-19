import 'package:flutter/material.dart';
import 'package:flutter_crypto_tracker/constants/theme.dart';
import 'package:flutter_crypto_tracker/models/local_storage.dart';
import 'package:flutter_crypto_tracker/pages/chart_page.dart';
import 'package:flutter_crypto_tracker/pages/home_page.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:flutter_crypto_tracker/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String currentTheme = await LocalStorage.getTheme() ?? "light";
  runApp(MyApp(
    theme: currentTheme,
  ));
}

class MyApp extends StatelessWidget {
  final String theme;
  MyApp({super.key, required this.theme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MarketProvider>(
              create: (context) => MarketProvider()),
          ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider(theme))
        ],
        child:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: ChartPage(),
          );
        }));
  }
}
