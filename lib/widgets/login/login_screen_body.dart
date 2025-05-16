import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/database/dao/user_dao.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/views/screens/home_screen.dart';
import 'package:fit_rush_app/views/screens/sign_up_screen.dart';
import 'package:fit_rush_app/widgets/sign_up/custom_sign_up_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool _showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user?.uid;

      final db = AppDatabase.instance;

      final userDao = UserDao(db);
      final loggedInUser = await userDao.getUserByUid(uid!);

      if (loggedInUser != null) {
        context.read<UserCubit>().setUser(loggedInUser);
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kIsLoggedInFlag, true);

      NavigationHelper.pushReplacement(
        destination: const HomeScreen(),
        context: context,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful!")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          const SizedBox(height: 60),

          // Logo
          Center(
            child: Image(
              image: AssetImage("assets/images/Logo-V2-red.png"),
              width: 80,
              height: 80,
            ),
          ),

          const SizedBox(height: 20),

          Center(
            child: Text(
              'Login to your Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          const SizedBox(height: 30),

          // Email
          CustomSignUpTextField(
            controller: _emailController,
            icon: Icons.email,
            hint: "Enter your email address",
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 16),

          // Password
          CustomSignUpTextField(
            controller: _passwordController,
            isPassword: !_showPassword,
            icon: Icons.lock,
            suffixIcon: IconButton(
              icon: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () => setState(() => _showPassword = !_showPassword),
            ),
            hint: "Enter password",
            keyboardType: TextInputType.visiblePassword,
          ),

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot password?',
                style: TextStyle(color: AppColors.kGreyColor),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Login Button
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: _loginUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () {
                  NavigationHelper.pushReplacement(
                    destination: SignUpScreen(),
                    context: context,
                  );
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Center(
            child: Text(
              "Alternatively Login with:",
              style: TextStyle(color: AppColors.kGreyColor),
            ),
          ),

          const SizedBox(height: 16),

          // Apple Login
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.apple, color: Colors.white),
            label: Text('APPLE ID', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Google Login with G icon
          ElevatedButton.icon(
            onPressed: () {},
            icon: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Text(
                  'G',
                  style: TextStyle(
                    color: Color(0xFF4285F4),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            label: Text(
              'GOOGLE',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
