import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';


MessagesStream messagesstream = MessagesStream();


void main() => runApp(FlashChat());



class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  WelcomeScreen.Wid ,
      routes: {
        WelcomeScreen.Wid :(context) => WelcomeScreen(),
        LoginScreen.Lid : (context)  => LoginScreen(),
        RegistrationScreen.Rid : (context)  => RegistrationScreen(),
        ChatScreen.Cid : (context) => ChatScreen(),
      },
    );
  }
}
