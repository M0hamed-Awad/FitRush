import 'package:fit_rush_app/styles/colors.dart';
import 'package:flutter/material.dart';

class GoalTextField extends StatefulWidget {
  final String label;
  final dynamic data;
  const GoalTextField({super.key, required this.label, required this.data});

  @override
  State<GoalTextField> createState() => _GoalTextFieldState();
}

class _GoalTextFieldState extends State<GoalTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild when focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;

    return TextField(
      focusNode: _focusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.label,
        floatingLabelStyle: TextStyle(
          color: isFocused ?  AppColors.kPrimaryColor :  AppColors.kGreyColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        hintText: "${widget.data}",
        contentPadding: EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  AppColors.kGreyColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  AppColors.kPrimaryColor, width: 2),
        ),
      ),
    );
  }
}
