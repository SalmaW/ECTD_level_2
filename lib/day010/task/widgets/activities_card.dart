import 'package:ectd2/day010/task/models/activities.dart';
import 'package:flutter/material.dart';

class ActivitiesCard extends StatelessWidget {
  const ActivitiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Activities> activities = [
      Activities(
        date: "12/2021 – 10/2022",
        teamName: "CIS Team",
        position: "PR Head",
        description:
            "•Planning and Coordinating events\n•Led sessions on how to make effective presentations and how to write professional emails.\n•Conflict Resolution: Implemented strategies to foster a harmonious work environment.",
      ),
      Activities(
        date: "02/2021 – 11/2021",
        teamName: "CIS Team",
        position: "PR Member",
        description:
            "Speaker Coordination: Communicated with speakers via email, and phone to persuade them to participate in our events.",
      ),
    ];
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: activities.map((item) {
              return subjectRow(
                date: item.date,
                teamName: item.teamName,
                position: item.position,
                description: item.description,
              );
            }).toList(),
          ),
        ));
  }

  Widget subjectRow({
    required String date,
    required String teamName,
    required String position,
    required String description,
  }) {
    return Row(
      children: [
        dateOfSubject(date: date),
        const Spacer(flex: 2),
        Expanded(
          flex: 16,
          child: subjectDetails(
            teamName: teamName,
            position: position,
            description: description,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget dateOfSubject({required String date}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }

  Widget subjectDetails(
      {required String teamName,
      required String description,
      required String position}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        Text(
          teamName,
          maxLines: 2, // Adjust maxLines if needed
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 8),
        Text(
          position,
          style: const TextStyle(fontStyle: FontStyle.italic),
          maxLines: 2, // Allow the text to wrap fully
          overflow: TextOverflow.visible,
          // style: const TextStyle(fontSize: 18.0),
        ),
        Text(
          description,
          maxLines: null, // Allow the text to wrap fully
          overflow: TextOverflow.visible,
          // style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
