import 'package:flutter/material.dart';

class TechnicalSkillsCard extends StatelessWidget {
  const TechnicalSkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> skills = [
      {
        "Core Computer Science: —":
            " OOP. | Clean Architecture | Solid basics of Data Structure and algorithms. | C++ | JAVA | Database fundamentals (Firebase, SQL, SQLite). | Agile approach. | SOLID"
      },
      {"Version Control: —": " Good understanding of GIT & GitHub"},
      {
        "Flutter: —":
            " Dart | BLoC | Provider | Shared Preferences | GetIt | Get | Path"
      },
      {"OS: —": " Good knowledge of Linux."},
    ];
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: skills.map((item) {
            String title = item.keys.first;
            String data = item.values.first;
            return Column(
              children: [
                Row(
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        data, maxLines: null,
                        // Allow the text to wrap fully
                        overflow: TextOverflow.visible,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
