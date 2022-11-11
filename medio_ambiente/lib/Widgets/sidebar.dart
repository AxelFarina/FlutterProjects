import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../providers/image_provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imgSelected = Provider.of<ImgProvider>(context).img;
    var img = File(imgSelected);
    return Drawer(
      backgroundColor: Color.fromRGBO(53, 120, 191, 1),
      elevation: 0.0,
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back),iconSize: 50, color: Colors.white,),
              ],
            ),
             Container(margin: EdgeInsets.symmetric(horizontal: 15),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 40,),
                   Container(
                     width: 150.0,
                     height: 150.0,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: imgSelected != '' ? FileImage(img) : NetworkImage('https://caricom.org/wp-content/uploads/Floyd-Morris-Remake-1024x879-1.jpg') as ImageProvider,
                         fit: BoxFit.cover,
                       ),
                       borderRadius: BorderRadius.all( Radius.circular(75.0)),
                       border: Border.all(
                         color: Colors.white,
                         width: 4.0,
                       ),
                     ),
                   ),
                   SizedBox(height: 10,),
                   Text('Ramon Perez',style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 20
                   ),),
                   SizedBox(height: 3,),
                   Text('Tecnico RAC, Licencia Basica',style: TextStyle(
                     color: Colors.white,
                       fontWeight: FontWeight.normal,
                       fontSize: 17
                   ),),
                   Divider(color: Colors.white,)
                 ],
               ),
             ),
            SizedBox(height: 30,),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.monetization_on,color: Colors.white, size: 30,),
                  SizedBox(width: 10,),
                  Text('Pago derecho a examen',style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.receipt_sharp,color: Colors.white, size: 30,),
                  SizedBox(width: 10,),
                  Text('Solicictud de examen',style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'exam_request');
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.email,color: Colors.white, size: 30,),
                  SizedBox(width: 10,),
                  Text('Mensajes',style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.white,),
                    Text('Estado',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 17
                    ),),
                    Text('AUN NO COMPETENTE',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                )),
            SizedBox(height: 20,),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.power_settings_new,color: Colors.white, size: 30,),
                  SizedBox(width: 10,),
                  Text('Cerrar Sesion',style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),),
                ],
              ),
              onTap: (){
                Navigator.pushReplacementNamed(context, 'home');
              },
            )
          ],
        ),
      ),
    );
  }
}
