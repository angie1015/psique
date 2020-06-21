import 'package:flutter/material.dart';
import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/forest_1.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    enabled: !logged,
                    controller: uctrl,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Email/Username',
                      hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white,fontSize: 24.0),
                    ),
                    onChanged: (e) {
                      setState(() {});
                    },
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    enabled: !logged,
                    controller: pctrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                      hintText: 'alphabets and numbers',
                      labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white,fontSize: 24.0),
                        hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (e) {
                      setState(() {});
                    },

                  ),
                  SizedBox(height: 10.0,),
                  Opacity(
                    opacity: .5,
                    child: MaterialButton(
                      child: Text('Sign Up',
                      style: GoogleFonts.pacifico(color: Colors.white, fontSize: 28,),
                      ),
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: canSignIn ? _signUp : null,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Opacity(
                    opacity: .5,
                    child: MaterialButton(
                      child: Text('Sign In',
                      style: GoogleFonts.pacifico(color: Colors.white, fontSize: 28,),),
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      onPressed: canSignIn && !logged ? _signIn : null,
                    ),
                  ),
                  SizedBox(height: 50.0,)
                ],
              ),
            ),
        ),
      ),
    );

  }
}
