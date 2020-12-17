import 'package:authentification/src/screens/sinup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _email, _password,_phone;
  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 150.0,
                child: Image.asset('images/bloodpic.PNG'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),

                 onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),

                ),

                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                    });
                  },
                  padding: EdgeInsets.all(15),
                  color: Colors.purpleAccent,
                  child: Text('                    Log In                    ', style: TextStyle(color: Colors.white)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupScreen()));
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.deepPurpleAccent,
                    child: Text('       Register Now     ', style: TextStyle(color: Colors.white)),
                  ),
                ),
            ])
          ],),
      ),
    );
  }

}