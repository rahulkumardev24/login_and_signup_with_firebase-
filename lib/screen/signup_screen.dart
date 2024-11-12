import 'package:connect_firebase/colors.dart';
import 'package:connect_firebase/domain/app_utils.dart';
import 'package:connect_firebase/screen/login_screen.dart';
import 'package:connect_firebase/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 270,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.PrimaryColor,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(130))),
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  right: 10,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/image/signup.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Create your account",
                        style: myTextStyle30(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                /// here we call custom text field  and -->  send value with constructor
                /// name box
                CustomTextField(
                  textEditingController: nameController,
                  hintText: "Enter username here ",
                  labelText: "Username",
                  suffixIcon: Icons.person,
                  filledColor: AppColors.field1,
                ),

                const SizedBox(
                  height: 10,
                ),

                /// email box
                CustomTextField(
                  textEditingController: emailController,
                  hintText: "Enter email here ",
                  labelText: "Email",
                  suffixIcon: Icons.email_outlined,
                  filledColor: AppColors.field2,
                ),

                const SizedBox(
                  height: 10,
                ),

                /// password box
                CustomTextField(
                  textEditingController: passwordController,
                  hintText: "Enter password here ",
                  labelText: "Password",
                  suffixIcon: Icons.lock,
                  prefixIcon: Icons.remove_red_eye,
                  filledColor: AppColors.field3,
                ),

                const SizedBox(
                  height: 10,
                ),

                /// conform password box
                CustomTextField(
                  textEditingController: conformPasswordController,
                  hintText: "Enter confirm password here ",
                  labelText: "Confirm password",
                  suffixIcon: Icons.lock,
                  prefixIcon: Icons.remove_red_eye,
                  filledColor: AppColors.field4,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(130)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            /// here we apply sign up logic
                            var email = emailController.text;
                            var password = passwordController.text;
                            var conformPassword =
                                conformPasswordController.text;
                            if (password == conformPassword) {
                              var auth = FirebaseAuth.instance;
                              var userCredential =
                                  await auth.createUserWithEmailAndPassword(
                                      email: email, password: password);

                              if (userCredential.user != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("User Successfully Singup")));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupScreen()));
                              }
                            }
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                height: 50,
                                decoration:
                                    BoxDecoration(color: AppColors.field1),
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: myTextStyle25(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: const Center(
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              /// here apply google sing in
                              /// --------------------------------GOOGLE BUTTON ---------------------------///
                              GestureDetector(

                                /// ------------------- here we apply logic ---------------------------///
                                onTap: () async {
                                  try {
                                    final GoogleSignIn googleSignIn = GoogleSignIn();

                                    // Check if the user is already signed in
                                    GoogleSignInAccount? googleUser = googleSignIn.currentUser;

                                    // If no current user, initiate sign-in process
                                    googleUser ??= await googleSignIn.signIn();

                                    // If sign-in was cancelled, exit
                                    if (googleUser == null) {
                                      return;
                                    }

                                    // Authenticate with Firebase
                                    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
                                    final AuthCredential credential = GoogleAuthProvider.credential(
                                      accessToken: googleAuth.accessToken,
                                      idToken: googleAuth.idToken,
                                    );

                                    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                                    User? user = userCredential.user;

                                    if (user != null) {
                                      // Navigate to the home screen
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomeScreen()),
                                      );
                                    }
                                  } catch (e) {
                                    print("Error during Google Sign-In: $e");
                                  }
                                },

                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/icon/google.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),


                              const SizedBox(width: 10),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/icon/facebook.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/icon/instagram.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 12,
                      bottom: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Do you have an account? ",
                            style: myTextStyle20(fontColor: Colors.black54),
                          ),
                          OutlinedButton(
                              onPressed: () {
                                /// here we navigate into login screen
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: BorderSide(
                                      width: 2, color: Colors.white)),
                              child: Text(
                                "Login",
                                style: myTextStyle18(fontColor: Colors.black87),
                              ))
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

/// IN THIS VIDEO --> HOW TO UPLOAD FLUTTER PROJECT ON GITHUB
/// NOW TEST THE APP
