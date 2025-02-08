import 'package:connect_firebase/domain/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordFogetScreen extends StatefulWidget {
  const PasswordFogetScreen({super.key});

  @override
  State<PasswordFogetScreen> createState() => _PasswordFogetScreenState();
}

class _PasswordFogetScreenState extends State<PasswordFogetScreen> {
  TextEditingController email = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter email"),
          ),
          ElevatedButton(
              onPressed: () {
                if(email.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Plz Enter email ",
                      style: myTextStyle18(fontColor: Colors.red),
                    ),
                    backgroundColor: Colors.greenAccent,
                  ));
                }else if(email.text.isNotEmpty){
                  _auth.sendPasswordResetEmail(email: email.text.trim());
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Password reset link send in register link ",
                    style: myTextStyle18(fontColor: Colors.red),
                  ),
                  backgroundColor: Colors.greenAccent,
                ));
              },
              child: Text("Forget Password"))
        ],
      ),
    );
  }
}
