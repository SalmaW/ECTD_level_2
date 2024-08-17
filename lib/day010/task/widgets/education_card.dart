import 'package:ectd2/day010/task/models/education.dart';
import 'package:flutter/material.dart';

class EduCard extends StatelessWidget {
  const EduCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Education> educationList = [
      Education(
        date: "04/2024 - Present",
        location: "Cairo, Egypt",
        title: "Mobile App Developer",
        institution: "Digital Egypt Pioneers Initiative (DEPI) 6-Month Diploma",
      ),
      Education(
        date: "09/2019 – 09/2023",
        location: "Mansoura, Egypt",
        title: "B.S. of Software Engineering",
        institution:
            "Faculty of Computer and Information Sciences, Mansoura University",
        description:
            "Graduation project (Role: Flutter Developer): Grade: A+\n•IDEA: reverse vending machine that turns waste into money.\n•Developed: static Mobile app using Dart and BloC (8 screens linked).\n•Testing: Applied Unit Testing on the Mobile application",
      ),
    ];

    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: educationList.map((item) {
              return subjectRow(
                date: item.date,
                location: item.location,
                title: item.title,
                company: item.institution,
                description: item.description ?? "",
              );
            }).toList(),
          ),
        ));
  }

  Widget subjectRow({
    required String date,
    String? location,
    required String title,
    required String company,
    String? description,
  }) {
    return Row(
      children: [
        dateOfSubject(date: date, location: location ?? ""),
        const Spacer(flex: 2),
        Expanded(
          flex: 16,
          child: subjectDetails(
            title: title,
            organization: company,
            description: description ?? "",
          ),
        ),
      ],
    );
  }

  Widget dateOfSubject({required String date, required String location}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(fontSize: 18.0),
        ),
        Text(
          location,
          style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }

  Widget subjectDetails(
      {required String title,
      required String description,
      required String organization}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        Text(
          title,
          maxLines: 2, // Adjust maxLines if needed
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 8),
        Text(
          organization,
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
