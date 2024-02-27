import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/Screen/sign_up_screen.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_iconbtn.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //textEditing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  signInWithEmail() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog("Login successfully");
    } on FirebaseAuthException catch (e) {
      print('Failed with error code:${e.code}');
      print(e.message);

      if (e.code == 'invalid-email') {
        _showMyDialog('No user found for email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        _showMyDialog('Wrong password provided for that user.');
      }
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ถ้ามี3ส่วนใช้วิตเจตนี้Scaffold
//     appBar: AppBar(
      //       title: const Text('Main Program'),
      //      centerTitle: true,
      //    ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            10, 20, 10, 20), //ให้fromห่างจากซ้ายบนขวาล่างกี่pixel
        child: Form(
          child: Column(
            children: [
              const Spacer(), //ทำให้จออยู่กลางถีบบน
              Text(
                "Hello, ready to get started ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please sign in with your email and password ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Enter you email",
                  obscureText: false, //ถ้า true textนั้นจะเป็นรหัสผ่าน
                  labelText: "Email"),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                  labelText: "Password"),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                            style: GoogleFonts.kanit(
                              textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              color: const Color.fromARGB(255, 236, 80, 145),
                            ),
                            "Forgot password ?")),
                  ],
                ),
              ), //onPressedฟังก์ชั่นกดแล้วไปไหน ใช้(){}เพื่อให้เป็นปุ่มเปล่าๆยังไม่ให้ทำไร
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: signInWithEmail, hinText: "Sign In"),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.purple,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Or Continue with",
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 104, 101, 101),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButton(imagPath: 'assets/images/google-logo.png'),
                  SizedBox(
                    width: 20,
                  ),
                  MyIconButton(imagPath: 'assets/images/apple-icon.png'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a number ?",
                    style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 236, 80, 145),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(), //ทำให้จออยู่กลางถีบล่าง
            ],
          ),
        ),
      ),
    );
  }
} //const กับ googlefont ด้วยกันไม่ได้ รันไทม์กับคอมไพล์ไทม์
