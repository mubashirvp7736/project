import 'package:flutter/material.dart';
import 'login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

@override
  void initState() {
    gotoLogin();
    super.initState();
  }

 




Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
          width: 1000,
          height:1000,
          child: Image(image: AssetImage("assets/mubashir.png")),
          )
        ),
    );
  } 

  

Future<void> gotoLogin() async{
 await Future.delayed(Duration(seconds: 3));
 Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (ctx){
  return ScreenLogin();
 }));
}

}