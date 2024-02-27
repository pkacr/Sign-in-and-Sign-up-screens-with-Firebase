import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'BOOK A RIDE',
      body:
          'Get attractive offers to enjoy your trip with a variety of ride option',
      footer: Column(
        children: [
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text(
                "Let's Go",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      image: SizedBox(
        width: 200,
        height: 200,
        child: Image.asset('/images/travel.jpg', fit: BoxFit.cover),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: Colors.purple,
        ),
      ),
    ),
    PageViewModel(
      title: 'PLAN DESTINATION',
      body: 'Plan your dream and make your vision come to life with us',
      footer: Column(
        children: [
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 236, 80, 145),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8, //เงา
              ),
              onPressed: () {},
              child: const Text(
                "Let's Go",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      image: SizedBox(
        width: 150,
        child:Image.asset('images/vecteezy.png' , fit: BoxFit.cover),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: Colors.orange,
        ),
      ),
    ),
    PageViewModel(
      title: 'ENJOY YOUR TRIP',
      body:
          'Enjoy every second of your holiday. also have a fun and enjoyable trip',
      footer: Column(
        children: [
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text(
                "Let's Go",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      image: SizedBox(
        width: 167,
        child:Image.asset('/images/l.png', fit: BoxFit.cover),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: Colors.purple,
        ),
      ),
    ),
  ]; //class เวลาประกาศ stw less full มี final ต้องลบ const ออก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PLAN TRIP"),
        backgroundColor: Color.fromARGB(255, 18, 19, 19),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Kanit',
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color.fromARGB(255, 255, 203, 59),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: IntroductionScreen(
          pages: pages,
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(color: Colors.purple, fontFamily: 'Kanit'),
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(color: Colors.purple, fontFamily: 'Kanit'),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.purple,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
          dotsDecorator: const DotsDecorator(
            //ทำให้ปุ่มข้างล่างมีสีสัน เป็นปุ่มจุดๆเลื่อนๆเหมือนเลื่อนโฆษณา
            size: Size(15, 15),
            color: Colors.orange,
            activeColor: Colors.black,
            activeSize: Size.square(20),
          ),
        ),
      ),
    );
  }

  void onDone(context) async {
    //ถ้ากดปุ่มdone จะกระโดดไปหน้า home_screen.dart
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
