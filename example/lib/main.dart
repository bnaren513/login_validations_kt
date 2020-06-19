import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:loginvalidationskt/loginvalidationskt.dart';



void main() {
  runApp(MyCustomForm());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion =  await Loginvalidationskt.platformVersiondata;
     // platformVersion =  await Flutterlogin.showToast('data@gmail.com');
      //platformVersion = await Flutterlogin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: 
        //MyCustomForm()
        Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 final _emailtext = TextEditingController();
 final _passwordtext = TextEditingController();
  String _validate = 'Validation Fail';
String _emailVersion = 'Unknown';
String _passwordVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
     //initPlatformState();
  }
  //  // Platform messages are asynchronous, so we initialize in an async method.
   // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> emailPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //platformVersion =  await Flutterlogin.platformVersiondata;
      platformVersion =  await Loginvalidationskt.emailValidation(_emailtext.text);
       setState(() {
      _emailVersion = platformVersion;
        
    });
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(_emailVersion)));
    
      //platformVersion = await Flutterlogin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
 
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _emailVersion = platformVersion;
        
    });
    
  }
  Future<void> validPlatformState() async {
    String email;
    String password;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //platformVersion =  await Flutterlogin.platformVersiondata;
      email =  await Loginvalidationskt.emailValidation(_emailtext.text);
      password =  await Loginvalidationskt.passwordValidation(_passwordtext.text);
     
       setState(() {
          if (email == 'Email Validation true' && password == 'Password Validation true')
          {
            _validate = 'Validation Success';
          }
          else
          {
             _validate = 'Validation Fail';
          }
      
      });
      
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(_validate)));
    
      //platformVersion = await Flutterlogin.platformVersion;
    } on PlatformException {
      email = 'Failed to get platform version.';
      password = 'Failed to get platform version.';
    }
 
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _emailVersion = email;
      _passwordVersion = password;
        
    });
    
  }
   Future<void> passwordPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //platformVersion =  await Flutterlogin.platformVersiondata;
      platformVersion =  await Loginvalidationskt.passwordValidation(_passwordtext.text);
       setState(() {
      _passwordVersion = platformVersion;
        
    });
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(_passwordVersion)));
    
      //platformVersion = await Flutterlogin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
 
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _passwordVersion = platformVersion;
        
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           home :Scaffold(
             key:_scaffoldKey,
        appBar: AppBar(
          title: Text('TextField Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_emailVersion),
              Text(_passwordVersion),
              TextField(
                controller: _emailtext,
                decoration: InputDecoration(
                  labelText: 'Enter the email',
                 // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                ),
              ),
              TextField(
                controller: _passwordtext,
                decoration: InputDecoration(
                  labelText: 'Enter the password',
                 // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  // setState(() {
                  //   _text.text.isEmpty ? _validate = true : _validate = false;
                  // });
                  //emailPlatformState();
                 // passwordPlatformState();
                 validPlatformState();
                },
                child: Text('Submit'),
               // textColor: Colors.white,
               // color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}