import 'package:drift/drift.dart' as d;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/models/user_goal_model.dart';
import 'package:fit_rush_app/widgets/sign_up/bio_data_step.dart';
import 'package:fit_rush_app/widgets/sign_up/custom_sign_up_text_field.dart';
import 'package:fit_rush_app/widgets/sign_up/step_indicator.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatefulWidget {
  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final db = AppDatabase();

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
              Row(children: [_stepAccountIndicator(), _stepBioDataIndicator()]),
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
      CustomSignUpTextField(
        controller: _nameController,
        hint: "Full name",
        icon: Icons.person,
        validator: (val) => val == null || val.isEmpty ? "Name required" : null,
      ),
      const SizedBox(height: 16),
      CustomSignUpTextField(
        controller: _emailController,
        hint: "Email address",
        icon: Icons.email,
        validator:
            (val) =>
                val == null || !val.contains('@')
                    ? "Valid email required"
                    : null,
      ),
      const SizedBox(height: 16),
      CustomSignUpTextField(
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
      ),
      const SizedBox(height: 16),
      CustomSignUpTextField(
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
              () =>
                  setState(() => _showConfirmPassword = !_showConfirmPassword),
        ),
        validator:
            (val) =>
                val == _passwordController.text
                    ? null
                    : "Passwords don't match",
      ),
    ],
  );

  Widget _buildBioDataStep() {
    return BioDataStep(
      heightController: _heightController,
      weightController: _weightController,
      onPickDate: _pickDate,
      selectedDate: _selectedDate,
    );
  }

  Widget _stepAccountIndicator() {
    return StepIndicator(
      label: "Account",
      index: 0,
      currentStep: _currentStep,
      onTap: () => setState(() => _currentStep = 0),
    );
  }

  Widget _stepBioDataIndicator() {
    return StepIndicator(
      label: "Bio Data",
      index: 1,
      currentStep: _currentStep,
      onTap: () => setState(() => _currentStep = 1),
    );
  }

  Widget _buildSubmitButton() => ElevatedButton(
    onPressed: () {
      if (_currentStep == 0) {
        setState(() => _currentStep = 1);
      } else {
        _submitSignup();
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFF06500),
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    child: Text(
      _currentStep == 0 ? "Next" : "Sign Up",
      style: const TextStyle(color: Colors.white),
    ),
  );

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
      // Create account with Firebase Auth
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final uid = userCredential.user!.uid;

      // Prepare local Drift user data
      final name = _nameController.text.trim();
      final height = double.tryParse(_heightController.text.trim());
      final weight = double.tryParse(_weightController.text.trim());
      final dob = _selectedDate;

      // User Goals Default

      final userGoal = UserGoalModel(
        walkedSteps: 0,
        weight: 0,
        distanceCovered: 0,
        caloriesBurned: 0,
      );

      final userCompanion = UsersTableCompanion(
        uid: d.Value(uid),
        name: d.Value(name),
        height: d.Value(height),
        weight: d.Value(weight),
        age: d.Value(dob != null ? _calculateAge(dob) : null),
        gender: const d.Value(null), // Or from a dropdown/controller
        longTermGoal: d.Value(userGoal),
        dailyGoal: d.Value(userGoal),
      );

      // 3. Insert into local Drift DB
      final insertedUserId = await db.into(db.usersTable).insert(userCompanion);

      // Check if the insertion was successful
      if (insertedUserId > 0) {
        // Data was saved successfully
        debugPrint("[DEBUG] User saved successfully!");
        final allUsers = await db.select(db.usersTable).get();
        for (var user in allUsers) {
          print("User: ${user.name}, Email: ${user.age}");
        }
      } else {
        // Handle failure (if it occurs)
        debugPrint("[DEBUG] Failed to save user.");
      }

      _showMessage("Signup successful!");
    } catch (e) {
      _showMessage("Signup failed: ${e.toString()}");
    }
  }

  void _showMessage(String message) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message)));

  int _calculateAge(DateTime dob) {
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }
}
