import 'package:cedano_import/Widgets/singin.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 150),
            child: Center(
                child: Text("NOMBRE RESERVADO")
            ),
          ),
        ),
        SignIn()
      ],
    );
  }
}