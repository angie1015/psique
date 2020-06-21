import 'package:flutter/material.dart';
import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:psique/main.dart';

class StandardPage extends StatefulWidget {
  final auth;
  const StandardPage(this.auth);
  @override
  _StandardPageState createState() => _StandardPageState();
}

class _StandardPageState extends State<StandardPage> {
  bool logged;
  dynamic currentAuth;
  TextEditingController uctrl;
  TextEditingController pctrl;

  @override
  void initState() {
    super.initState();
    logged = false;
    uctrl = TextEditingController();
    pctrl = TextEditingController();
  }


  Auth0 get auth {
    return widget.auth;
  }




  void _signUp() async {
    try {
      await auth.auth.createUser({
        'email': uctrl.text,
        'password': pctrl.text,
        'connection': 'Username-Password-Authentication'
      });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeRoute(),));
    } catch (e) {
      print(e);
    }
  }

  void _signIn() async {
    try {
      await auth.auth.passwordRealm({
        'username': uctrl.text,
        'password': pctrl.text,
        'realm': 'Username-Password-Authentication'
      });

    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    bool canSignIn = (uctrl.text != null &&
        pctrl.text != null &&
        uctrl.text.isNotEmpty &&
        pctrl.text.isNotEmpty);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                enabled: !logged,
                controller: uctrl,
                decoration: const InputDecoration(
                  hintText: 'Email/Username',
                ),
                onChanged: (e) {
                  setState(() {});
                },
              ),
              TextField(
                enabled: !logged,
                controller: pctrl,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'alphabets and numbers',
                  labelText: 'Password'
                ),
                onChanged: (e) {
                  setState(() {});
                },
              ),
              MaterialButton(
                child: const Text('Sign Up'),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: canSignIn ? _signUp : null,
              ),
              MaterialButton(
                child: const Text('Sign In'),
                color: Colors.redAccent,
                textColor: Colors.white,
                onPressed: canSignIn && !logged ? _signIn : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
