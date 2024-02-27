import 'package:flutter/material.dart';
import 'package:onboarding_screen/Screen/home_screen.dart';
import 'package:onboarding_screen/Screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//เชื่อม firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //รอทำการเชื่อมต่อ firebase ถึงจะทำงานได้
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true; //เก็
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: IntroScreen(), //ไฟล์หน้าจอหลัก
      home: show ? IntroScreen() : HomeScreen(),
    );
  }
}
