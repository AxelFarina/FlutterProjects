import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ExamRequest extends StatelessWidget {
  const ExamRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
                size: 40,
              )),
          elevation: 0.0,
          backgroundColor: ThemeData.light().scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_sharp,
                    size: 40,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'SOLICITUD DE EXAMEN',
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              UploadFile(),
              //ListViewFiles(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String dropdownValue = 'Basica';
  List<PlatformFile> files = [];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc'],
        allowMultiple: true);

    if (result != null) {
      files += result.files;
      /*result?.files.forEach((element) {
      filesPath.add(element.path);
    });*/
      //  files.push(result?.files.map((e) => e.path));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var items = List<String>.generate(10000, (i) => 'Item $i');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButtonFormField(
            isExpanded: true,
            hint: Text('Basica, Media, Tecnica'),
            decoration: InputDecoration(
              labelText: 'Seleccione categoria',
            ),
            items: <String>['Basica', 'Media', 'Tecnica']
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
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.cloud_upload_outlined,
          size: 100,
          color: Colors.blue,
        ),
        Text(
          'Adjuntar Titulos Academicos',
          style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 18,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            onPressed: () async {
              _pickFile();
            },
            child: Text('Buscar Archivos'),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
          ),
        ),
        if (files.length > 0)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: files.length,
                itemBuilder: (BuildContext context, int index) {
                  var image = File(files[index].path!);
                  return ListTile(
                    title: Row(
                      children: [
                        Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: FileImage(image),fit: BoxFit.cover)
                            ),),
                        SizedBox(width: 10,),
                        Expanded(child: Text(files[index].name, overflow: TextOverflow.ellipsis,softWrap: false,maxLines: 1,)),
                      ],
                    ),
                  );
                }),
          ),
        if (files.length > 0)
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Enviar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
          ),
      ],
    );
  }
}
/*
class ListViewFiles extends StatelessWidget {
  const ListViewFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var items = List<String>.generate(10000, (i) => 'Item $i');

        return
  }
}*/
