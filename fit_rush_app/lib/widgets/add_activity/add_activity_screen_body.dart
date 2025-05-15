import 'dart:async';

import 'package:fit_rush_app/models/exercise_type_enum.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:flutter/material.dart';

class AddActivityScreenBody extends StatefulWidget {
  const AddActivityScreenBody({Key? key}) : super(key: key);

  @override
  State<AddActivityScreenBody> createState() => _AddActivityScreenBodyState();
}

class _AddActivityScreenBodyState extends State<AddActivityScreenBody> {
  ExerciseType? _selectedExerciseType;
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  DateTime? _selectedDateTime;

  final _formKey = GlobalKey<FormState>();

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime:
          _selectedDateTime != null
              ? TimeOfDay.fromDateTime(_selectedDateTime!)
              : TimeOfDay.now(),
    );

    if (time == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  void _onAdd() {
    if (_formKey.currentState!.validate()) {
      if (_selectedExerciseType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an Activity Type')),
        );
        return;
      }
      if (_selectedDateTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select Date & Time')),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Activity added successfully!')),
      );

      setState(() {
        _selectedExerciseType = null;
        _durationController.clear();
        _caloriesController.clear();
        _notesController.clear();
        _selectedDateTime = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Activity',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Activity Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<ExerciseType>(
                  value: _selectedExerciseType,
                  items:
                      ExerciseType.values
                          .map(
                            (e) =>
                                DropdownMenuItem(value: e, child: Text(e.name)),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedExerciseType = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  validator:
                      (value) =>
                          value == null
                              ? 'Please select an activity type'
                              : null,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Duration (min)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _durationController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter duration in minutes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter duration';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Duration must be a number';
                    }
                    if (int.parse(value) <= 0) {
                      return 'Duration must be greater than zero';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Calories Burned',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _caloriesController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter calories burned',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter calories burned';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Calories must be a number';
                    }
                    if (int.parse(value) < 0) {
                      return 'Calories cannot be negative';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Date & Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: _pickDateTime,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.kGreyColor),
                    ),
                    child: Text(
                      _selectedDateTime == null
                          ? 'Select Date & Time'
                          : '${_selectedDateTime!.toLocal()}'.split('.').first,
                      style: TextStyle(
                        color:
                            _selectedDateTime == null
                                ? AppColors.kGreyColor
                                : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Notes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _notesController,
                  decoration: InputDecoration(
                    hintText: 'Optional notes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _onAdd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kButtonColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
