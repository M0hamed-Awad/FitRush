import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  // UI Helpers
  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.white),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.black.withOpacity(0.2),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  InputDecoration _passwordInput(
    String hint,
    bool visible,
    VoidCallback toggle,
  ) {
    return InputDecoration(
      prefixIcon: Icon(Icons.lock, color: Colors.white),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white70),
      suffixIcon: IconButton(
        icon: Icon(
          visible ? Icons.visibility : Icons.visibility_off,
          color: Colors.white,
        ),
        onPressed: toggle,
      ),
      filled: true,
      fillColor: Colors.black.withOpacity(0.2),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1995),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
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

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _stepIndicator(String label, int index) {
    final isActive = _currentStep == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentStep = index),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: isActive ? Color(0xFFF06500) : Colors.grey,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isActive ? Color(0xFFF06500) : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Container(
              height: 2,
              color: isActive ? Color(0xFFF06500) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepContent() {
    if (_currentStep == 0) {
      return Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: _inputDecoration("Full name", Icons.person),
            style: TextStyle(color: Colors.white),
            validator:
                (val) => val == null || val.isEmpty ? "Name required" : null,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: _inputDecoration("Email address", Icons.email),
            style: TextStyle(color: Colors.white),
            validator:
                (val) =>
                    val == null || !val.contains('@')
                        ? "Valid email required"
                        : null,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: !_showPassword,
            decoration: _passwordInput("Password", _showPassword, () {
              setState(() => _showPassword = !_showPassword);
            }),
            style: TextStyle(color: Colors.white),
            validator:
                (val) =>
                    val != null && val.length >= 6
                        ? null
                        : "Minimum 6 characters",
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_showConfirmPassword,
            decoration: _passwordInput(
              "Confirm Password",
              _showConfirmPassword,
              () {
                setState(() => _showConfirmPassword = !_showConfirmPassword);
              },
            ),
            style: TextStyle(color: Colors.white),
            validator:
                (val) =>
                    val == _passwordController.text
                        ? null
                        : "Passwords don't match",
          ),
        ],
      );
    } else {
      return Column(
        children: [
          GestureDetector(
            onTap: _pickDate,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: _inputDecoration(
                  _selectedDate != null
                      ? "${_selectedDate!.toLocal()}".split(' ')[0]
                      : "Date of Birth",
                  Icons.calendar_today,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _heightController,
            decoration: _inputDecoration("Height (cm)", Icons.height),
            style: TextStyle(color: Colors.white),
            validator:
                (val) => val == null || val.isEmpty ? "Height required" : null,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _weightController,
            decoration: _inputDecoration("Weight (kg)", Icons.monitor_weight),
            style: TextStyle(color: Colors.white),
            validator:
                (val) => val == null || val.isEmpty ? "Weight required" : null,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121416),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.white),
              SizedBox(height: 12),
              Center(
                child: Image.network(
                  'https://i.ibb.co/k2K0hS4J/test4.png',
                  width: 60,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Create an Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "Help us finish setting up your account.",
                  style: TextStyle(color: Color(0xFFC0C0C0)),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  _stepIndicator("Account Information", 0),
                  _stepIndicator("Biodata", 1),
                ],
              ),
              SizedBox(height: 24),
              _stepContent(),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_currentStep == 0) {
                    setState(() => _currentStep = 1);
                  } else {
                    _submitSignup();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF06500),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  _currentStep == 0 ? "Next" : "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
