import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatelessWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_add,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 15),
                    child: Text(
                      'CREAR USUARIO',
                      style: TextStyle(fontSize: 22, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
          _formularios()
        ],
      ),
    ));
  }
}

class _formularios extends StatefulWidget {
  @override
  State<_formularios> createState() => _formulariosState();
}

class _formulariosState extends State<_formularios> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dropdownValue = 'Santo Domingo';

  List<String> cities = [
    "Santo Domingo",
    "Japon",
    "China",
    "Moscow",
    "New Jersey",
    "Vasai"
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                autofocus: false,
                initialValue: '',
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Este campo es requerido';
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Cedula',
                    labelText: 'Cedula',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextFormField(
                autofocus: false,
                initialValue: '',
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Este campo es requerido';
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Nombre Completo',
                    labelText: 'Nombre Completo',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextFormField(
                autofocus: false,
                initialValue: '',
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Este campo es requerido';
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Correo Electronico',
                    labelText: 'Correo Electronico',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                    width: 100,
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      hint: Text('Tecnico'),
                      decoration: InputDecoration(
                          labelText: 'Soy',
                          labelStyle: TextStyle(color: Colors.blue)),
                      items: <String>['Santo Domingo', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  width: 220,
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '',
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value?.isEmpty ?? true)
                        return 'Este campo es requerido';
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: 'Telefono',
                        labelText: 'Telefono',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextFormField(
                autofocus: false,
                initialValue: '',
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Este campo es requerido';
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Direccion',
                    labelText: 'Direccion',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: DropdownButtonFormField(
                  isExpanded: true,
                  value: dropdownValue,
                  decoration: InputDecoration(
                      labelText: 'Provincia',
                      labelStyle: TextStyle(color: Colors.blue)),
                  items: <String>['Santo Domingo', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 40),
                child: MaterialButton(
                  onPressed: () {},
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: Text(
                    'Enviar',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Ya tienes una cuenta?',
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: MaterialButton(
                    padding: EdgeInsets.only(right: 10),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('Inicie Sesion',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                  )
                )
              ],
            )
          ],
        ));
  }
}
