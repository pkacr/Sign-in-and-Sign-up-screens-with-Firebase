import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/Screen/home_screen.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final repasswordController = TextEditingController();

  signUpWithEmail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog('Create successfully');  //ถ้าไม่ใส่มันไม่ขึ้นเตือนง่ะว่าทำสำเร็จ
    } 
    on FirebaseAuthException catch(e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      /*if (e.code == 'weak-password') {
        _showMyDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }*/
    } 
    /*catch (e) {
      print(e);
    }*/
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          children: [
            const Spacer(),
            Text(
              "Welcome to our community",
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Colors.pink,
              ),
            ),
            Text(
              "\nTo get start,please provide your information and create an account.\n",
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
            ), //เรียกMyTextFieldมา
            MyTextField(
                controller: nameController,
                hintText: "Enter your name.",
                obscureText: false, //ไม่ได้ต้องการให้เป็นความลับ
                labelText: "Name"),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: emailController,
                hintText: "Enter your Email.",
                obscureText: false,
                labelText: "Email"),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: passwordController,
                hintText: "Enter your password.",
                obscureText: true,
                labelText: "Password"),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: repasswordController,
                hintText: "Enter your password again.",
                obscureText: true,
                labelText: "Re-password"),
            const SizedBox(
              height: 20,
            ),
            MyButton(onTap: signUpWithEmail, hinText: 'Sign up'),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have a member ?",
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
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        )),
      ),
    );
  }
}