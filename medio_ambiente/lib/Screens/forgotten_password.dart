import 'package:flutter/material.dart';
import 'package:medio_ambiente/Widgets/background.dart';

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackGround(),
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 200),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, bottom: 100, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '¿Olvido su contraseña?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                                children: [
                                  TextSpan(
                                      text: '\nEscriba su direccion de',
                                      style:
                                          TextStyle(fontWeight: FontWeight.normal)),
                                  TextSpan(
                                      text: '\ncorreo',
                                      style: TextStyle(fontWeight: FontWeight.normal))
                                ]),
                          ),
                          TextFormField(
                            autofocus: false,
                            initialValue: '',
                            style: TextStyle(
                              color: Colors.white
                            ),
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value?.isEmpty ?? true) return 'Este campo es requerido';
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                labelText: 'Correo electronico',
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white
                                  )
                                ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white
                              )
                            )),
                          ),
                          Padding(
                              padding:
                              EdgeInsets.only(top: 40),
                              child: MaterialButton(
                                onPressed: () {},
                                height: 50,
                                minWidth: double.infinity,
                                color: Colors.green,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0)),
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )),
                        ],
                      ),
                    ),

                    SizedBox(height: 60,),
                    Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿No tienes una cuenta?',
                              style: TextStyle(color: Colors.white),
                            ),
                            MaterialButton(
                              padding: EdgeInsets.only(right: 30),
                              onPressed: (){
                                Navigator.pushReplacementNamed(context, 'create_user');
                              },
                              child: Text('CREAR',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        )
                    )
                  ]),
            ),
          ),
        )
      ],
    ));
  }
}
