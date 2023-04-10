import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas/AppTheme/theme_service.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ThemeData.dark().primaryColor,systemNavigationBarColor: ThemeData.dark().primaryColor));
  runApp(AppState());
}


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ( _ )=> MoviesProvider(), lazy: false,),
          ChangeNotifierProvider<ThemeService>(create: ( _ )=> ThemeService())
        ],
    child: MyApp(),);
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: themeService.darkTheme
              ? Brightness.dark
              : Brightness.light,
          seedColor: Colors.indigo
        )
      ),
    );
  }
}
