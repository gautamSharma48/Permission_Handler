import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  Future<void> requestPermission() async{
    var storagestatus =await Permission.storage.status;

    if(!storagestatus.isGranted){
      await Permission.storage.request();
    }

    var contactstatus =await Permission.contacts.status;

    if(!contactstatus.isGranted){
      await Permission.contacts.request();
    }

    var micro =await Permission.microphone.status;

    if(!micro.isGranted){
      await Permission.microphone.request();
    }
    var bluttoth =await Permission.bluetooth.status;

    if(!bluttoth.isGranted){
      await Permission.bluetooth.request();
    }
    /*
    var status2 = await Permission.manageExternalStorage.status;

    if(!status2.isGranted){
      await Permission.manageExternalStorage.request();
    }*/
  }



  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Column(
        children: [
          Center(

          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
