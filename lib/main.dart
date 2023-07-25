
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode');
  late ThemeMode themeMode;
  if(isDarkMode==null){
    themeMode = ThemeMode.system;
  }
  else{
    themeMode = isDarkMode? ThemeMode.dark:ThemeMode.light;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Calculations()),
        ChangeNotifierProvider(create: (_)=> History()),
        ChangeNotifierProvider(create: (_) => ThemeProvider(themeMode)),
      ],

      child: cons MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>;(
      builder: (context,theme,child) => MaterialApp(
        themMode: theme.themeMode,
        theme: AppTheme.darkThemeData,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}