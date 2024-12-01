import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:intl/intl.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: Text('No meeting history available'),
          );
        }

        var meetings = (snapshot.data! as dynamic).docs;
        if (meetings.isEmpty) {
          return const Center(
            child: Text('No meetings found'),
          );
        }

        return ListView.builder(
          itemCount: meetings.length,
          itemBuilder: (context, index) {
            var meeting = meetings[index].data();
            String meetingName = meeting['meetingName'] ?? 'Unknown';
            DateTime createdAt =
                meeting['createdAt']?.toDate() ?? DateTime.now();

            return ListTile(
              title: Text(
                'Room Name: $meetingName',
              ),
              subtitle: Text(
                'Joined on ${DateFormat.yMMMd().format(createdAt)}',
              ),
            );
          },
        );
      },
    );
  }
}
