// Flutter packages
import 'package:flutter/material.dart';
// Dart packages
import 'package:http/http.dart' show get;
import 'dart:convert';
// Project import
import '../models/image_model.dart';
import '../widgets/image_list.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Images App'),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
      ),
    );
  }
}