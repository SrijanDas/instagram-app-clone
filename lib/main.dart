import 'package:apps/responsive/mobile_screen_layout.dart';
import 'package:apps/responsive/responsive_layout_screen.dart';
import 'package:apps/responsive/web_screen_layout.dart';
import 'package:apps/screens/login_screen.dart';
import 'package:apps/screens/signup_screen.dart';
import 'package:apps/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyBZieDSABOcA_fInDY6a_9MvHVIqsnno8o',
      appId: '1:1036488047277:web:cfd03f7e26fafccbe32424',
      messagingSenderId: '1036488047277',
      projectId: 'instagram-clone-af307',
      authDomain: "instagram-clone-af307.firebaseapp.com",
      storageBucket: "instagram-clone-af307.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Instagram clone",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: SignupScreen(),
    );
  }
}
