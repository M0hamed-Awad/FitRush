import 'package:fit_rush_app/widgets/splash/welcome_widget.dart';
import 'package:flutter/material.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF353A40), Color(0xFF121416)],
          stops: [0.23, 0.70],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ✅ Logo (new)
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 100,
            height: 100,
            child: Image.network(
              'https://i.ibb.co/k2K0hS4J/test4.png',
              fit: BoxFit.contain,
            ),
          ),

          // ✅ Subtitle
          Text(
            "Stronger, Healthier, Together",
            style: TextStyle(
              color: Color(0xFFC0C0C0),
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          ),

          SizedBox(height: 200),

          // ✅ Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeWidget()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFF06500)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                child: Text(
                  "Get started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
