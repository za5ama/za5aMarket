import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class upload extends StatefulWidget {
  const upload({super.key});

  @override
  State<upload> createState() => _uploadState();
}

class _uploadState extends State<upload> {
  final TextEditingController _label = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final ImagePicker _picker=ImagePicker();
  bool _imageIsSelected = false;
  Future<void> PickImage() async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _imageIsSelected = image==null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20), child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: const Color.fromARGB(255, 228, 225, 225)),
          height: MediaQuery.of(context).size.height * .75,
          width: MediaQuery.of(context).size.width * .9,
          child:  Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("List Your Item",style: TextStyle(fontSize: 37.5, fontWeight: FontWeight(1000), color: const Color.fromARGB(255, 42, 42, 42)),),
              const SizedBox(height: 20,),
              const Text("Product name", style: TextStyle(fontSize: 24),),
              const Text("Keep it short and pretty", style: TextStyle(fontSize: 12),),
              SizedBox(width: MediaQuery.of(context).size.width * .7, child: TextField(
                controller: _label,
                decoration: InputDecoration(focusColor: const Color.fromARGB(255, 51, 49, 49), fillColor: const Color.fromARGB(255, 60, 54, 244), hintText: "e.g., Gaming chair"),
              ),),


              const SizedBox(height: 40,),
              const Text("Product price", style: TextStyle(fontSize: 24),),
              const Text("A good price keeps you and your client happy", style: TextStyle(fontSize: 12),),
              SizedBox(width: MediaQuery.of(context).size.width * .7, child: TextField(
                controller: _price,
                decoration: InputDecoration(hintText: "99", suffixText: '\$'),                
              ),),


              const SizedBox(height: 40,),
              const Text("Add an Image", style: TextStyle(fontSize: 24),),
              const Text("Help your client visualize your product", style: TextStyle(fontSize: 12),),
              SizedBox(height: 10,),
              TextButton(onPressed: PickImage, child: Container(alignment: Alignment.center,decoration: BoxDecoration(color: const Color.fromARGB(255, 184, 86, 79), borderRadius: BorderRadius.circular(5)), width: MediaQuery.of(context).size.width*.5,height: 50,child: Text("Upload Image!",style: TextStyle(color: const Color.fromARGB(255, 225, 225, 225),fontWeight: FontWeight(250), fontSize: 30),),)),
              SizedBox(height: 10,),
              _imageIsSelected
              ? Text("No Image Selected!")
              : Text("Image Selected!"),
              
            ],
          ),),
          
          )
    )
    );
  }
}