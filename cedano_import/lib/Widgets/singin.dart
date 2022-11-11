import 'dart:ffi';

import 'package:cedano_import/Help/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final authServices = Provider.of<AuthServices>(context);

    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(213, 0, 0, 1), width: 2),
        borderRadius: BorderRadius.circular(50));

    UserCredential userCredential;

    Future getCredentials(String email, String password) async {
      try {
        authServices.errorPassword = null;
        authServices.error = null;
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        final user = userCredential.user;
        if (user != null) {
          Navigator.pushNamed(context, 'home_page');
        }
      } on FirebaseAuthException catch (e) {
        print("Este es el codigo de error: ${e.code}");
        authServices.error = e.code;
        print(e.message);
        authServices.errorPassword = e.message!;
      }
    }
/*
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    */

    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: TextFormField(
                initialValue: authServices.user,
                textAlign: TextAlign.left,
                autofocus: false,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onChanged: (value){
                  authServices.user = value;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true){
                    return 'Este campo es requerido';
                  }
                },
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                    enabledBorder: border,
                    focusedBorder: border,
                    errorBorder: border,
                    border: border,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Username',
                    label: Text(
                      'Username',
                      style: TextStyle(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.person_outlined)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                initialValue: authServices.password,
                textAlign: TextAlign.left,
                autofocus: false,
                obscureText: true,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onChanged: (value){
                  authServices.password = value;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Este campo es requerido';
                  }
                },
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                  errorText: authServices.errorPassword,
                    enabledBorder: border,
                    focusedBorder: border,
                    errorBorder: border,
                    border: border,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    label: Text(
                      'Password',
                      style: TextStyle(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.verified_user_outlined)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: SizedBox(
                    width: double.infinity,
                    child: const Center(child: Text('Log In'))),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Color.fromRGBO(213, 0, 0, 1))),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState!.validate()) {
                    //Navigator.pushNamed(context, 'home_page');
                    getCredentials(authServices.user!, authServices.password!);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
