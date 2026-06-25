import 'package:flutter/material.dart';
import 'package:za5amarket/pages/profile.dart';
import 'package:za5amarket/pages/catalog.dart';
import 'package:za5amarket/pages/upload.dart';


class Format extends StatefulWidget {
  const Format({super.key});

  @override
  State<Format> createState() => _FormatState();
}

class _FormatState extends State<Format> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: NavigationBar(
      onDestinationSelected: (int index){setState(() {currentPageIndex = index;});},
      destinations: <Widget>[
        NavigationDestination(icon: Icon(Icons.store), label: 'Catalog'),
        NavigationDestination(icon: Container(child: Icon(Icons.add, color: Colors.white,),decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(50)),width: 70, height: 50,), label: 'Sell Item'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedIndex: currentPageIndex,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    appBar: AppBar(
      title: Image.asset('assets/images/biglogo.png', width: 100,),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
      ],
    ),


    body: [catalog(),upload(),profile()][currentPageIndex],
    );
    }
}