import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/widgets/sign_up/bio_data_step.dart';
import 'package:fit_rush_app/widgets/sign_up/custom_sign_up_text_field.dart';
import 'package:fit_rush_app/widgets/sign_up/step_indicator.dart';
import 'package:fit_rush_app/widgets/sign_up/submit_button.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatefulWidget {
  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  DateTime? _selectedDate;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121416),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Icon(Icons.arrow_back_ios, color: Colors.white),
              const SizedBox(height: 12),
              Center(
                child: Image.network(
                  'https://i.ibb.co/k2K0hS4J/test4.png',
                  width: 60,
                ),
              ),
              const SizedBox(height: 16),
              _buildTitleText("Create an Account"),
              _buildSubtitleText("Help us finish setting up your account."),
              const SizedBox(height: 24),
              Row(
                children: [
                  _stepIndicator("Account Information", 0),
                  _stepIndicator("Biodata", 1),
                ],
              ),
              const SizedBox(height: 24),
              _currentStep == 0 ? _buildAccountStep() : _buildBioDataStep(),
              const SizedBox(height: 24),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) => Center(
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _buildSubtitleText(String text) => Center(
    child: Text(text, style: const TextStyle(color: Color(0xFFC0C0C0))),
  );

  Widget _buildAccountStep() => Column(
    children: [
      _buildUsernameTextField(),
      const SizedBox(height: 16),
      _buildEmailTextField(),
      const SizedBox(height: 16),
      _buildPasswordTextField(),
      const SizedBox(height: 16),
      _buildConfirmPasswordTextField(),
    ],
  );

  CustomSignUpTextField _buildUsernameTextField() {
    return CustomSignUpTextField(
      controller: _nameController,
      hint: "Full name",
      icon: Icons.person,
      validator: (val) => val == null || val.isEmpty ? "Name required" : null,
    );
  }

  CustomSignUpTextField _buildEmailTextField() {
    return CustomSignUpTextField(
      controller: _emailController,
      hint: "Email address",
      icon: Icons.email,
      validator:
          (val) =>
              val == null || !val.contains('@') ? "Valid email required" : null,
    );
  }

  CustomSignUpTextField _buildConfirmPasswordTextField() {
    return CustomSignUpTextField(
      controller: _confirmPasswordController,
      hint: "Confirm Password",
      icon: Icons.lock,
      isPassword: !_showConfirmPassword,
      suffixIcon: IconButton(
        icon: Icon(
          _showConfirmPassword ? Icons.visibility : Icons.visibility_off,
          color: Colors.white,
        ),
        onPressed:
            () => setState(() => _showConfirmPassword = !_showConfirmPassword),
      ),
      validator:
          (val) =>
              val == _passwordController.text ? null : "Passwords don't match",
    );
  }

  CustomSignUpTextField _buildPasswordTextField() {
    return CustomSignUpTextField(
      controller: _passwordController,
      hint: "Password",
      icon: Icons.lock,
      isPassword: !_showPassword,
      suffixIcon: IconButton(
        icon: Icon(
          _showPassword ? Icons.visibility : Icons.visibility_off,
          color: Colors.white,
        ),
        onPressed: () => setState(() => _showPassword = !_showPassword),
      ),
      validator:
          (val) =>
              val != null && val.length >= 6 ? null : "Minimum 6 characters",
    );
  }

  Widget _buildBioDataStep() {
    return BioDataStep(
      heightController: _heightController,
      weightController: _weightController,
      onPickDate: _pickDate,
      selectedDate: _selectedDate,
    );
  }

  Widget _stepIndicator(String label, int index) {
    return StepIndicator(
      label: label,
      index: index,
      currentStep: _currentStep,
      onTap: () => setState(() => _currentStep = 0),
    );
  }

  Widget _buildSubmitButton() {
    return SubmitButton(
      isFinalStep: _currentStep == 1,
      onPressed: () {
        if (_currentStep == 0) {
          setState(() => _currentStep = 1);
        } else {
          _submitSignup();
        }
      },
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1995),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _submitSignup() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      _showMessage("Passwords do not match");
      return;
    }

    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final uid = userCredential.user!.uid;
      // Insert user data locally using Drift

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
            'name': _nameController.text.trim(),
            'email': email,
            'dob': _selectedDate?.toIso8601String() ?? "",
            'height': _heightController.text.trim(),
            'weight': _weightController.text.trim(),
            'createdAt': Timestamp.now(),
          });

      _showMessage("Signup successful!");
    } catch (e) {
      _showMessage("Signup failed: ${e.toString()}");
    }
  }

  void _showMessage(String message) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message)));
}
