import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/widgets/home/history_list.dart';
import 'package:flutter/material.dart';

class HistoryScreenBody extends StatelessWidget {
  const HistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final db = AppDatabase.instance;
    final firebaseUser = FirebaseAuth.instance.currentUser;
    final uid = firebaseUser?.uid ?? "_";

    return HistoryList(
      activityDao: db.activityHistoryDao,
      userUid: uid,
    );
  }
}
