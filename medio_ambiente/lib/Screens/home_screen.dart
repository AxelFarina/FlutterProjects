
import 'package:flutter/material.dart';

import '../Widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          BackGround(),

          //Pantalla
         SingleChildScrollView(
           child:
         Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/ave.png',width: 100,height: 100,filterQuality: FilterQuality.high,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ministerio de', style: TextStyle(
                                color: Colors.white
                              ),),
                              Text('Medio Ambiente', style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),),
                              Text('Y Recursos Naturales', style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 20,),
                      Text('Programa Nacional de Proteccion',style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),),
                      Text('de la Capa de Ozono (PRONAOZ)', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),)
                    ],
                  ),
                ),
              ),
              Formularios()
            ],
          )
         )
        ],
      ),
    );
  }
}


class Formularios extends StatefulWidget {
  @override
  State<Formularios> createState() => _FormulariosState();
}

class _FormulariosState extends State<Formularios> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10,top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: TextFormField(
                textAlign: TextAlign.center,
                autofocus: false,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                validator: (value){
                  if(value?.isEmpty ?? true) return 'Este campo es requerido';
                },
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nombre de Usuario',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10,top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: TextFormField(
                textAlign: TextAlign.center,
                autofocus: false,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.words,
                validator: (value){
                  if(value?.isEmpty ?? true) return 'Este campo es requerido';
                },
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                  hintText: 'Contraseña',

                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, 'forgotten_password');
            },
            child: Text('¿Olvido su contraseña?',style: TextStyle(color: Colors.white,),),
          ),
          Padding(
            padding:EdgeInsets.only(left: 40,right: 40,bottom: 10,top: 30),
            child: MaterialButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, 'profile_user');
                },
              height: 50,
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
              child: Text('Iniciar',style: TextStyle(
                fontSize: 18
              ),),
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 20,left: 40,right: 40),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(255, 255, 255, 0.3),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                    child: MaterialButton(
                      padding: EdgeInsets.only(right: 30),
                      onPressed: (){
                        Navigator.pushNamed(context, 'create_user');
                      },
                      child: Text('CREAR',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                    )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}