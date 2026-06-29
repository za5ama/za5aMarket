import 'package:flutter/material.dart';
import 'package:za5amarket/pages/login.dart';
import 'package:za5amarket/pages/screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zmnoamqtksvstmoroqfo.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inptbm9hbXF0a3N2c3Rtb3JvcWZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIyODQ1ODcsImV4cCI6MjA5Nzg2MDU4N30.ChB6rqHUSDRJuyoQvKOYHhj99StrWpB8q3O18VHQqjs',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'za5amarket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(254, 101, 1, 0)),
      ),
      home: StreamBuilder<AuthState>(
    stream: Supabase.instance.client.auth.onAuthStateChange,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      
      final session = snapshot.data?.session;
      if (session != null) {
        return const Format(); 
      } else {
        return const loginPage();
      }
    },
  ),
    );
  }
}

