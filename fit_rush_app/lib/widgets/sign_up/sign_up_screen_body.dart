import 'package:drift/drift.dart' as d;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/models/user_goal_model.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/views/screens/home_screen.dart';
import 'package:fit_rush_app/views/screens/login_screen.dart';
import 'package:fit_rush_app/widgets/sign_up/bio_data_step.dart';
import 'package:fit_rush_app/widgets/sign_up/custom_sign_up_text_field.dart';
import 'package:fit_rush_app/widgets/sign_up/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreenBody extends StatefulWidget {
  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final db = AppDatabase.instance;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _goalStepsController = TextEditingController();
  final _goalWeightController = TextEditingController();
  final _goalDistanceController = TextEditingController();
  final _goalCaloriesController = TextEditingController();

  DateTime? _selectedDate;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return _buildSignUpScreenBody();
  }

  Padding _buildSignUpScreenBody() {
    return Padding(
      padding: AppSizes.kPaddingH16V8,
      child: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              AppSizes.kSizeH40,
              Center(
                child: Image(
                  image: AssetImage("assets/images/Logo-V2-red.png"),
                  width: 40,
                  height: 40,
                ),
              ),
              AppSizes.kSizeH16,
              _buildTitleText("Create an Account"),
              _buildSubtitleText("Help us finish setting up your account."),
              AppSizes.kSizeH24,
              AppSizes.kSizeH24,
              Row(
                children: [
                  _stepAccountIndicator(),
                  _stepBioDataIndicator(),
                  _stepGoalIndicator(),
                ],
              ),
              AppSizes.kSizeH24,
              if (_currentStep == 0)
                _buildAccountStep()
              else if (_currentStep == 1)
                _buildBioDataStep()
              else
                _buildGoalStep(),
              AppSizes.kSizeH24,
              _buildSubmitButton(),
              AppSizes.kSizeH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      NavigationHelper.pushReplacement(
                        destination: LoginScreen(),
                        context: context,
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) => Center(
    child: Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _buildSubtitleText(String text) => Center(
    child: Text(text, style: const TextStyle(color: AppColors.kGreyColor)),
  );

  Widget _buildGoalStep() {
    return Column(
      spacing: 16,
      children: [
        CustomSignUpTextField(
          controller: _goalStepsController,
          hint: "Daily Steps Goal",
          icon: Icons.directions_walk,
          keyboardType: TextInputType.number,
          validator:
              (val) =>
                  val == null || int.tryParse(val) == null
                      ? "Enter a number"
                      : null,
        ),
        CustomSignUpTextField(
          controller: _goalWeightController,
          hint: "Goal Weight (kg)",
          icon: Icons.monitor_weight,
          keyboardType: TextInputType.number,
          validator:
              (val) =>
                  val == null || double.tryParse(val) == null
                      ? "Enter a valid weight"
                      : null,
        ),
        CustomSignUpTextField(
          controller: _goalDistanceController,
          hint: "Daily Distance Goal (km)",
          icon: Icons.social_distance,
          keyboardType: TextInputType.number,
          validator:
              (val) =>
                  val == null || double.tryParse(val) == null
                      ? "Enter a valid distance"
                      : null,
        ),
        CustomSignUpTextField(
          controller: _goalCaloriesController,
          hint: "Daily Calories Goal",
          icon: Icons.local_fire_department,
          keyboardType: TextInputType.number,
          validator:
              (val) =>
                  val == null || double.tryParse(val) == null
                      ? "Enter a valid calorie count"
                      : null,
        ),
      ],
    );
  }

  Widget _buildAccountStep() {
    return Column(
      spacing: 16,
      children: [
        CustomSignUpTextField(
          controller: _nameController,
          hint: "Full name",
          icon: Icons.person,
          validator:
              (val) => val == null || val.isEmpty ? "Name required" : null,
        ),
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
                  val != null && val.length >= 6
                      ? null
                      : "Minimum 6 characters",
        ),
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
                () => setState(
                  () => _showConfirmPassword = !_showConfirmPassword,
                ),
          ),
          validator:
              (val) =>
                  val == _passwordController.text
                      ? null
                      : "Passwords don't match",
        ),
      ],
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

  Widget _stepGoalIndicator() {
    return StepIndicator(
      label: "Goals",
      index: 2,
      currentStep: _currentStep,
      onTap: () => setState(() => _currentStep = 2),
    );
  }

  Widget _buildSubmitButton() => ElevatedButton(
    onPressed: () {
      if (_currentStep < 2) {
        setState(() => _currentStep++);
      } else {
        _submitSignup();
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primary,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: AppSizes.kBorderRadius6),
    ),
    child: Text(
      _currentStep < 2 ? "Next" : "Sign Up",
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
        goalStepsCount: int.tryParse(_goalStepsController.text.trim()) ?? 0,
        goalWeight: double.tryParse(_goalWeightController.text.trim()) ?? 0,
        goalDistanceCovered:
            double.tryParse(_goalDistanceController.text.trim()) ?? 0,
        goalCaloriesBurned:
            double.tryParse(_goalCaloriesController.text.trim()) ?? 0,
      );

      final userCompanion = UsersTableCompanion(
        uid: d.Value(uid),
        name: d.Value(name),
        height: d.Value(height),
        weight: d.Value(weight),
        email: d.Value(email),
        age: d.Value(dob != null ? _calculateAge(dob) : null),
        gender: const d.Value(null), // Or from a dropdown/controller
        longTermGoal: d.Value(userGoal),
        dailyGoal: d.Value(userGoal),
      );

      // Insert into local Drift DB
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

      // Get Logged In User
      final userQuery = db.select(db.usersTable)
        ..where((tbl) => tbl.uid.equals(uid));
      final loggedInUser = await userQuery.getSingleOrNull();

      if (loggedInUser != null) {
        context.read<UserCubit>().setUser(loggedInUser);
        NavigationHelper.pushReplacement(
          destination: HomeScreen(),
          context: context,
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(kIsLoggedInFlag, true);
      }
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
