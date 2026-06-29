import 'package:flutter/material.dart';
import 'login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  void feedback(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 5),)
    );
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool verif(String email, String password){
    if(email.isEmpty){feedback(context, "Enter Email!"); return false;}
    if(email.indexOf("@")==-1){feedback(context, "Email address is unvalid, try using another one"); return false;}
    if(password.isEmpty){feedback(context, "Enter Password!"); return false;}
    if(password.length < 8){feedback(context, "Password must have at least 8 characters!"); return false;}
    return true;
    
  }

  Future<void>signup(String mail, String pass)async{
    if(verif(mail,pass)){
    try{
    await Supabase.instance.client.auth.signUp(email: mail, password: pass);
    }
    on AuthException catch(e){
      String? error = e.code;
      print(error);
      if(error=="user_already_exists"){feedback(context, "User Already Exists!");}
      else if(error=="over_email_send_rate_limit"){feedback(context, "Too many requests, try again later!");}
      else if(error=="email_address_invalid"){feedback(context, "Email address is unvalid, try using another one");}
      else{feedback(context, "Unknown error");}
      _email.clear();
      _password.clear();
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Column( crossAxisAlignment: CrossAxisAlignment.center,
      children: [SizedBox(height: MediaQuery.of(context).size.height*.25,child: Column(children: [
        const SizedBox(height: 40,),
        Image.asset("assets/images/biglogo.png", width: 260,),
        SizedBox(height: 20,),
        const Text('Welcome!', style: TextStyle(fontSize: 25,fontWeight: FontWeight(250)),),
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
              child: TextButton(onPressed: (){signup(_email.text, _password.text);}, child: Text("Sign Up",style: TextStyle(color: Colors.white, fontSize: 15),)),
            ),
            const SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.center ,children: [
              Text("Already have an account?"),
              TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));}, child: Text("Log In!",style: TextStyle(fontWeight: FontWeight(700), fontSize: 17),))
            ],)
          ],),
        )
      ,const SizedBox(height: 40,),
      Text("Created By BigZa5")],
    )),)
  );}
}