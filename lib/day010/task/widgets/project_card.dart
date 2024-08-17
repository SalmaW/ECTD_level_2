import 'package:ectd2/day010/task/models/project.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = [
      Project(
          date: "06/2024 – 07/2024",
          projectName: "Metro EG",
          projectLink: Uri.parse("https://github.com/SalmaW/metro_in_JAVA"),
          fieldName: "Transportation App",
          description:
              "This is a Java-based console application designed to assist Egyptian metro passengers. It includes several user-friendly features:\n•Displaying the shortest route between stations\n•Calculating ticket prices\n•Estimating arrival times\n•Indicating the direction of travel\n•Showing the number of stations between the start and end points of a journey."),
      Project(
          date: "06/2024 – 06/2024",
          projectName: "Market Manager App",
          projectLink: Uri.parse(
              "https://github.com/SalmaW/ECTD_levelOne_final_project"),
          fieldName: "Financial app",
          description:
              "Market Manager is a Flutter-based mobile application designed to streamline market management by replacing traditional paper-based methods. The app utilizes a comprehensive database to manage various market aspects, including Categories, Products, Orders, Currency, Clients, and OrderItems,as well as financial data such as Sales Operations and Sales History.\nFeatures:\n•Home Screen\n•Category Management\n•Client Management\n•Product Management\n•Sale Operations\n•Sales History\n•Sorting and Filtering\n•Delete Functionality"),
      Project(
          date: "05/2024 – 05/2024",
          projectLink: Uri.parse(
              "https://github.com/SalmaW/CodeAlpha_Projects/tree/master/quiz_app"),
          projectName: "QuizME",
          fieldName: "Educational App",
          description:
              "QuizME mobile application built using Flutter, QuizME allows users to facilitate quiz engagement through category-based questions. Admins access the dashboard with 'Admin' input, enhancing categories, while users quiz, track scores, and skip questions. Utilizing Flutter's 'get' and 'flutter_svg' packages, and 'shared_preferences' for storage.\nFeatures:\n•Category Management\n•Question Bank\n•Quiz Mode\n•Skipping Questions\n•Score Tracking"),
    ];
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: projects.map((item) {
            return subjectRow(
              date: item.date,
              projectName: item.projectName,
              onPressed: item.projectLink,
              fieldName: item.fieldName,
              description: item.description,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget subjectRow({
    required String date,
    required String projectName,
    required Uri onPressed,
    required String fieldName,
    required String description,
  }) {
    return Row(
      children: [
        dateOfSubject(date: date),
        const Spacer(flex: 2),
        Expanded(
          flex: 16,
          child: subjectDetails(
            projectName: projectName,
            onPressed: onPressed,
            fieldName: fieldName,
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

  Widget subjectDetails({
    required String projectName,
    required String fieldName,
    required String description,
    required Uri onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        Row(
          children: [
            Text(
              projectName,
              maxLines: 3, // Adjust maxLines if needed
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20.0),
            ),
            IconButton(
                onPressed: () => _launchUrl(onPressed),
                icon: const Icon(Icons.link))
          ],
        ),
        Text(
          fieldName,
          style: const TextStyle(fontStyle: FontStyle.italic),
          maxLines: null, // Allow the text to wrap fully
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

  Future<void> _launchUrl(Uri linkUrl) async {
    try {
      if (await canLaunchUrl(linkUrl)) {
        await launchUrl(linkUrl);
      } else {
        throw 'Could not launch $linkUrl';
      }
    } catch (e) {
      print(e);
    }
  }
}
