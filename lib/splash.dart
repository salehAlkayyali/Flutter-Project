import 'dart:async';
import 'package:flutter/material.dart';
import 'package:serviceproject/start_one.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer when the screen is first displayed
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen after three seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Screen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned(
            top: 180,
            right: -screenWidth / 2,
            child: Image.asset(
              'images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          CustomPaint(
            painter: BlueLinePainter(),
            size: Size(screenWidth, screenHeight),
          ),
        ],
      ),
    );
  }
}

class BlueLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height);

    canvas.translate(-size.width / 2.5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


