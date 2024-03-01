import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.imagPath,
  });
  final String imagPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 2),
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(255, 253, 249, 250),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 3), // changes position of shadow
        ),]
      ),
      child: Image.asset(
        imagPath,
        height: 40,
        
        
      ),
    );
  }
}
