import 'package:connect_firebase/screen/login_screen.dart';
import 'package:connect_firebase/screen/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}



/// STEP 1 : create account firebase console
/// STEP 2 : DOWNLOAD GIT
/// STEP 3 : connect firebase with flutter
/// STEP 4 : Download node js
/// STEP 5 : FIRST COMMEND IS RUN ON COMMEND PROPPED
/// STEP 6 : SECOND commend run in android studio terminal
/// step 7 : SECOND commend is not NOT Run then restart your computer
/// STEP 8 : AFTER THAT SECOND COMMEND IS RUN SUCCESSFULLY
/// STEP 9 : ADD dependency
/// STEP 10 : RUN APP app is run if app is run then good if not run then change some thing
/// IN NEXT VIDEO LOGIN AND SIGNUP
/// IF ANY ERROR THEN COMMENT
///
/// In this video login and signup with firebase
/// in previous video connect firebase with flutter
///
/// // first ui create for signup --> Done
/// // second ui create for login --> Done
/// UI PART COMPLETE  --> done
/// apply login
/// know apply logic part signup and login with firebase auth
///  firebase auth apply  auth part is complete
///  IN NEXT VIDEO USER NAME OR OTHER DETAILS STORE IN FIREBASE STORE --> NEXT VIDEO
///  TEST THE APP  --> TEST THE APP
///
/// SOURCE CODE LINK IN DESCRIPTION BOX
/// /// SUBSCRIBE PLZ
/// IF ANY ERROR THEN COMMENT ON COMMENT BOX 