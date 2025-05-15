import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/views/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LandingScreenBody extends StatelessWidget {
  const LandingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ✅ Logo (new)
          Container(
            margin: AppSizes.kMarginBottom20,
            width: 100,
            height: 100,
            child: Image(image: AssetImage("assets/images/Logo-V2-red.png")),
          ),

          // ✅ Subtitle
          Text(
            "Stronger, Healthier, Together",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
              fontWeight: FontWeight.bold,
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
                  //TODO
                  // Navigate to Login
                  NavigationHelper.push(
                    destination: SignUpScreen(),
                    context: context,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: AppSizes.kBorderRadius6,
                    ),
                  ),
                ),
                child: Text(
                  "Get started",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
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
