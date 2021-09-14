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

  static bool rightwrong=false;
  @override
   void initState() {
     var y=requestPermission(Permission.storage) ;
    final rightwrong=y;

     super.initState();
  }

  Future<bool> requestPermission(Permission status) async{
var result=await status.status;


      if (!result.isGranted) {
        await Permission.storage.request();
        
        setState(() {
          rightwrong=true;
        });
        return rightwrong;
      }else{
        
      }
      return false;

/*    var contactstatus =await Permission.contacts.status;

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
*/
    /*
    var status2 = await Permission.manageExternalStorage.status;

    if(!status2.isGranted){
      await Permission.manageExternalStorage.request();
    }*/
  }

_settext(bool x,String s){
    return Container(
      margin: EdgeInsets.only(left: 42.0,bottom: 16),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //requestPermission(Permission.storage),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  x?Image.asset("assets/images/VectorX.jpg")
                      :Image.asset("assets/images/VectorY.jpg"),
                ],
              ),

              SizedBox(width: 32,height: 16,),
              Text(s,style: TextStyle(
                  fontSize: 14,color: Colors.black,
                fontWeight: FontWeight.w400,
              ),),
            ],
          )
        ],

      ) ,
    );
}

  @override
  Widget build(BuildContext context) {

       return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 27.0,right: 112.0,left: 112.0),
              child: Center(
                child: Text('Persmission Allowed:',
                style: TextStyle(
                  fontStyle:FontStyle.normal,
                  decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            SizedBox(height: 41,),
             var returnstatus=await requestPermission(Permission.camera),
            _settext(true, "File system"),
            _settext(true, "Camera"),
            _settext(true, "Location"),
            _settext(true, "Blutooth"),
            _settext(true, "SMS"),
            _settext(true, "Voice Input"),
            _settext(true, 'Notifications'),
          ],
        )
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
