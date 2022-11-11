import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medio_ambiente/providers/image_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/sidebar.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: SideBar(),
          body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverAppBar(
                      backgroundColor: ThemeData.light().scaffoldBackgroundColor,
                      iconTheme: IconThemeData(color: Colors.blue, size: 35),
                      pinned: true,
                      floating: true,
                      expandedHeight: 300.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfilePage(),
                          ],
                        ),
                      ),
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: ([
                            Container(height:40,child: Center(child: Text('SOBRE MI',))),
                            Container(height: 40,child: Center(child: Text('CONFIGURAR')))
                          ])
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                  children: [
                    SafeArea(
                      top: false,
                        bottom: false,
                        child: Builder(
                            builder: (BuildContext context){
                              return CustomScrollView(
                                  key: PageStorageKey('SOBRE MI'),
                                slivers: [
                                  SliverOverlapInjector(
                                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                                  ),
                                  SliverToBoxAdapter(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10,right: 10,top: 30),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Descripcion', style: TextStyle(
                                              color: Color.fromRGBO(204, 203, 209, 1),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),),
                                          Text('Serio, trabajador, listo para aceptar cualquier desafio aplicando mis conocimientos sobre las buenas practicas de refrigeracion.'),
                                          SizedBox(height: 40,),
                                          Row(
                                            children: [
                                              Text('Licencia', style: TextStyle(
                                                  color: Color.fromRGBO(204, 203, 209, 1),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              Container(
                                                margin: EdgeInsets.only(left: 5),
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(143, 143, 143, 1),
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Center(
                                                  child: Text('Pendiente', style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                  ),),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 10,),
                                          Text('Competente para trabajos domesticos. Maneja Aires acondicionados, freezers y neveras. ')
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                        )
                    ),
                    SafeArea(
                        top: false,
                        bottom: false,
                        child: Builder(
                            builder: (BuildContext context){
                              return CustomScrollView(
                                key: PageStorageKey('CONFIGURAR'),
                                slivers: [
                                  SliverOverlapInjector(
                                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                                  ),
                                  SliverToBoxAdapter(
                                    child: Form(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10,top: 30),
                                          child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width:  MediaQuery.of(context).size.width * 0.70,
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
                                                    hintText: 'Telefono',
                                                    labelText: 'Telefono',
                                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                                    labelStyle: TextStyle(color: Colors.blue)),
                                              ),
                                            ),
                                            MaterialButton(onPressed: (){},child: Text('Edit',style: TextStyle(
                                              color: Colors.blue
                                            ),),)
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width:  MediaQuery.of(context).size.width * 0.70,
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
                                                    hintText: 'Correo electronico',
                                                    labelText: 'Correo electronico',
                                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                                    labelStyle: TextStyle(color: Colors.blue)),
                                              ),
                                            ),
                                            MaterialButton(onPressed: (){},child: Text('Edit',style: TextStyle(
                                              color: Colors.blue
                                            ),),)
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width:  MediaQuery.of(context).size.width * 0.70,
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
                                            MaterialButton(onPressed: (){},child: Text('Edit',style: TextStyle(
                                              color: Colors.blue
                                            ),),)
                                          ],
                                        ),
                                      ],
                                    ),
                                        )
                                    ),
                                  )
                                ],
                              );
                            }
                        )
                    ),
                  ]
              )
          ),
        )
    );

  }
}

class ProfilePage extends StatefulWidget {
   ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  File? image;

  Future<String?> _cropImage(String path) async {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 90,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );

      return croppedFile?.path;
  }

  Future pickImage() async {
    try{
      var imgProvider = Provider.of<ImgProvider>(context,listen: false);
      //String? imgSelected = imgProvider.img;
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      //final imageTemp = File(image.path);
      //setState(()=>this.image = imageTemp);
      imgProvider.img = (await _cropImage(image.path))!;
     if(imgProvider.img != '') {
       setState(()=>this.image = File(imgProvider.img));
     }
    } on PlatformException catch(e){
      print('Failed to pick a image: ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerRight,
              children: [
                CircleAvatar(
                  backgroundImage: image != null ? FileImage(image!): Image.network('https://caricom.org/wp-content/uploads/Floyd-Morris-Remake-1024x879-1.jpg').image,
                  radius: 75,
                ),
                Positioned(
                  left: 120,
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(84, 146, 203, 0.8)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {
                          pickImage();
                        },
                        child: Icon(Icons.camera_alt_outlined,)),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Ramon Perez',style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),),
        ),Text('Tecnico RAC, Licencia Basica',style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20
          ),),
      ],
    );
  }
}
