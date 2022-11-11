import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../screens/screens.dart';

class NoNetworkConnection extends StatelessWidget {
  const NoNetworkConnection({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage('assets/noWifi.jpg'),
            width: 300,
            height: 300,
            ),
          ),
          Text("Oops!",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,color: Colors.black
          ),),
          SizedBox(height: 20,),
          Text("There is no internet connection\n Please check your internet connection",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
              fontWeight: FontWeight.w500,
            height: 1.3,color: Colors.black
          ),),
          SizedBox(height: 20,),
          OutlinedButton(
              onPressed: (){
                moviesProvider.tryAgain();
              },
              style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(170, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
              child: Text("Try Again",style: TextStyle(
            fontSize: 20
                ,color: Colors.black
          ),))
        ],
      ),
    );
  }
}