import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/database/dao/activity_history_dao.dart';
import 'package:flutter/material.dart';
import 'history_card.dart';

class HistoryList extends StatelessWidget {
  final ActivityHistoryDao activityDao;
  final String userUid;

  const HistoryList({
    super.key,
    required this.activityDao,
    required this.userUid,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ActivityHistoryTableData>>(
      stream: activityDao.watchActivitiesByUserId(userUid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No activity history found.'));
        }

        final activities = snapshot.data!;

        return ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            final activity = activities[index];
            return HistoryCard(activity: activity);
          },
        );
      },
    );
  }
}
