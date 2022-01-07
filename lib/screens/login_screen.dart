import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {

  static const String Lid = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  {

   final _auth = FirebaseAuth.instance;
   bool showSpinner = false;
   String email;
   String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: ModalProgressHUD(
        inAsyncCall:   showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'Logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                //to make the keyboard looks like mail one
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your mail')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                //to make the password be like stars
                  obscureText: true,
                  textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your Password')
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                children: [
                  RoundedButton(title: 'Log in',colour: Colors.lightBlueAccent
                    ,onPressed: ()async {
                    //Implement login functionality.
                      setState(() {
                        showSpinner = true;
                      });
                      try{
                      final user =await _auth.signInWithEmailAndPassword(email: email, password: password);

                      if (user != null){
                        Navigator.pushNamed(context, ChatScreen.Cid);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                      }
                      catch(e){
                        print(e);
                      }
                  },),

                  RoundedButton(title: 'Register',colour: Colors.lightBlueAccent
                    ,onPressed: ()async {
                      //Implement login functionality.
                      setState(() {
                        showSpinner = true;
                      });
                      try{
                        final user =await _auth.signInWithEmailAndPassword(email: email, password: password);

                        if (user != null){
                          Navigator.pushNamed(context, ChatScreen.Cid);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      }
                      catch(e){
                        print(e);
                      }
                    },),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
