import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: Supabase.instance.client.auth.signOut, child:Text("Log Out")),
    );
  }
}