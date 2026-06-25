import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Column( crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40,),
        Image.asset("assets/images/biglogo.png", width: 200,),
      
      ],
    )),)
  );}
}