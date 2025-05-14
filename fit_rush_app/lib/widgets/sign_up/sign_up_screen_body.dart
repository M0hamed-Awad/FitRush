import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget _buildTitleText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

  Widget _buildSubtitleText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(color: Color(0xFFC0C0C0)),
        ),
      );

  Widget _buildAccountStep() => Column(
        children: [
          _buildTextField(
            controller: _nameController,
            hint: "Full name",
            icon: Icons.person,
            validator: (val) => val == null || val.isEmpty ? "Name required" : null,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            hint: "Email address",
            icon: Icons.email,
            validator: (val) => val == null || !val.contains('@')
                ? "Valid email required"
                : null,
          ),
          const SizedBox(height: 16),
          _buildPasswordField(
            controller: _passwordController,
            hint: "Password",
            visible: _showPassword,
            toggle: () => setState(() => _showPassword = !_showPassword),
          ),
          const SizedBox(height: 16),
          _buildPasswordField(
            controller: _confirmPasswordController,
            hint: "Confirm Password",
            visible: _showConfirmPassword,
            toggle: () => setState(() => _showConfirmPassword = !_showConfirmPassword),
            validator: (val) => val == _passwordController.text
                ? null
                : "Passwords don't match",
          ),
        ],
      );

  Widget _buildBioDataStep() => Column(
        children: [
          GestureDetector(
            onTap: _pickDate,
            child: AbsorbPointer(
              child: _buildTextField(
                hint: _selectedDate != null
                    ? "${_selectedDate!.toLocal()}".split(' ')[0]
                    : "Date of Birth",
                icon: Icons.calendar_today,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _heightController,
            hint: "Height (cm)",
            icon: Icons.height,
            validator: (val) => val == null || val.isEmpty ? "Height required" : null,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _weightController,
            hint: "Weight (kg)",
            icon: Icons.monitor_weight,
            validator: (val) => val == null || val.isEmpty ? "Weight required" : null,
          ),
        ],
      );

  Widget _buildTextField({
    TextEditingController? controller,
    required String hint,
    required IconData icon,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: _inputDecoration(hint, icon),
      style: const TextStyle(color: Colors.white),
      validator: validator,
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool visible,
    required VoidCallback toggle,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !visible,
      decoration: _passwordInput(hint, visible, toggle),
      style: const TextStyle(color: Colors.white),
      validator: validator ??
          (val) => val != null && val.length >= 6
              ? null
              : "Minimum 6 characters",
    );
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
                  backgroundColor:
                      isActive ? const Color(0xFFF06500) : Colors.grey,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isActive ? const Color(0xFFF06500) : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              height: 2,
              color: isActive ? const Color(0xFFF06500) : Colors.grey,
            ),
          ],
        ),
      ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          _currentStep == 0 ? "Next" : "Sign Up",
          style: const TextStyle(color: Colors.white),
        ),
      );

  InputDecoration _inputDecoration(String hint, IconData icon) => InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      );

  InputDecoration _passwordInput(String hint, bool visible, VoidCallback toggle) =>
      InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
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

  void _showMessage(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
