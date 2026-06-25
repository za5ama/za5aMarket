import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Column( crossAxisAlignment: CrossAxisAlignment.center,
      children: [SizedBox(height: MediaQuery.of(context).size.height*.25,child: Column(children: [
        const SizedBox(height: 40,),
        Image.asset("assets/images/biglogo.png", width: 260,),
        SizedBox(height: 20,),
        const Text('Welcome Back!', style: TextStyle(fontSize: 25,fontWeight: FontWeight(250)),),
        SizedBox(height: 20,),])),
        Container(width: MediaQuery.of(context).size.width * .9, height: MediaQuery.of(context).size.height*.5, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromARGB(255, 238, 238, 238)),
          child: Column(children: [
            const SizedBox(height: 20,),
            const Text("Email", style: TextStyle(fontSize: 17),),
            SizedBox(width:MediaQuery.of(context).size.width*.8 , child: TextField(controller: _email, decoration: InputDecoration(hintText: " something@smth.com",),)),
            const SizedBox(height: 30,),
            const Text("Password", style: TextStyle(fontSize: 17),),
            SizedBox(width:MediaQuery.of(context).size.width*.8 , child: TextField(obscureText: true,controller: _password, decoration: InputDecoration(hintText: " pass123",),)),
            const SizedBox(height: 50,),
            Container(width: MediaQuery.of(context).size.width*.4, decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(5)),
              child: TextButton(onPressed: (){}, child: Text("Log In",style: TextStyle(color: Colors.white, fontSize: 15),)),
            ),
            const SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.center ,children: [
              Text("Don't have an account?"),
              TextButton(onPressed: (){}, child: Text("Sign Up!",style: TextStyle(fontWeight: FontWeight(700), fontSize: 17),))
            ],)
          ],),
        )
      ,const SizedBox(height: 40,),
      Text("Created By BigZa5")],
    )),)
  );}
}