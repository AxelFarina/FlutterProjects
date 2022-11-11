import 'package:flutter/material.dart';
import 'package:medio_ambiente/Screens/screens.dart';
import 'package:medio_ambiente/providers/image_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImgProvider() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'create_user': (_) => CreateUser(),
          'forgotten_password': (_) => ForgottenPassword(),
          'profile_user': (_) => ProfileUser(),
          'exam_request': (_) => ExamRequest(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
