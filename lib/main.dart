import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:googleapi_questions/drive.dart';
import 'signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final drive = GoogleDrive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        onPressed: () async {
          var file = await FilePicker.getFile();
          drive.upload(file);
        },
        child: Text('Upload'),
      )),
    );
  }
}
