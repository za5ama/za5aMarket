import 'package:flutter/material.dart';
import 'login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Future<void>signup(String mail, String pass)async{
    print("email: ${mail}, pass: ${pass}");
    try{
    Supabase.instance.client.auth.signUp(email: mail, password: pass);
    }
    on AuthException catch(e){
      print("1 ${e}");
    }
    catch(e){
      print("2 ${e}");
    }
    _email.clear();
    _password.clear();
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
              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const loginPage()));}, child: Text("Log In!",style: TextStyle(fontWeight: FontWeight(700), fontSize: 17),))
            ],)
          ],),
        )
      ,const SizedBox(height: 40,),
      Text("Created By BigZa5")],
    )),)
  );}
}