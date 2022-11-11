import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool textScannig = false;
  String scannedText = "";

  final ImagePicker _picker = ImagePicker();

  String imgPath = '';

  Future pickImage() async {
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      textScannig = true;
      imgPath = image.path;
      setState(() {});
      getRecognisedText(image);
    }
    on PlatformException catch(e){
      print('Failed to pick an image ${e}');
      scannedText = "Error has occurred while scanning";
    }
  }

  Future<void> getRecognisedText(XFile image) async{
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for(TextBlock block in recognizedText.blocks){
      for(TextLine line in block.lines){
        scannedText = "$scannedText${line.text}\n";
      }
    }
    textScannig = false;
    setState((){});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imgPath != '' ? FileImage(File(imgPath)) as ImageProvider<Object> : NetworkImage('https://pbs.twimg.com/media/E1zU9xEXEAEsze3.jpg')
                )
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()=>pickImage(), child: Icon(Icons.photo_camera)),
            ],
          ),
          //if(!textScannig )
          Container(
            child: Text(scannedText),
          )
        ],
      ),
    );
  }
}
