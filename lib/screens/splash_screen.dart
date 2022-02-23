import 'dart:async';

import 'package:flutter/material.dart';


import 'package:notebook_app/screens/home_page.dart';
import 'package:notebook_app/utils/app_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _NoteBookSplashScreenState();
}



class _NoteBookSplashScreenState extends State<SplashScreen> {

  Duration duration = Duration(seconds:5);

  @override
  void initState() {
    super.initState();
    Timer(
        duration,
            (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
            return HomePage();
          }),
                  (route) => false);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Expanded(
                  flex:2,
                  child: Container(),
                ),
                Expanded(
                  flex:1,
                  child: AppName(),
                ),
                Expanded(
                  flex:1,
                  child: Container(),
                ),
                Container(
                  height:5,
                  width: 250,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Colors.blue,
                  ),
                ),
                Expanded(
                  flex:1,
                  child:Container(),
                )



              ],
            ),
          ),
        )
    );
  }
}

