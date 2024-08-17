import 'package:flutter/material.dart';

import '../../task/widgets/activities_card.dart';
import '../../task/widgets/card_info.dart';
import '../../task/widgets/education_card.dart';
import '../../task/widgets/internship_card.dart';
import '../../task/widgets/project_card.dart';
import '../../task/widgets/technicalSkills_card.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> partitions = [
      "Summary",
      "Education",
      "Internships",
      "Projects",
      "Technical Skills",
      "Extracurricular Activities"
    ];
    return Column(
      children: partitions.map((item) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(item,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                )),
            const Divider(color: Colors.black),
            if (item == "Summary")
              const CardInfo()
            else if (item == "Education")
              const EduCard()
            else if (item == "Internships")
              const InternshipCard()
            else if (item == "Projects")
              const ProjectCard()
            else if (item == "Technical Skills")
              const TechnicalSkillsCard()
            else if (item == "Extracurricular Activities")
              const ActivitiesCard(),
            const SizedBox(height: 25),
          ],
        );
      }).toList(),
    );
  }
}
