import 'package:ectd2/day010/task/models/internship.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InternshipCard extends StatelessWidget {
  const InternshipCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Internship> internships = [
      Internship(
        date: "07/20122 – 09/2022",
        certificateLink: Uri.parse(
            "https://drive.google.com/file/d/1j9mWwLUc3z3ucH3yogz_pRCCh39Z_gn7/view?usp=sharing"),
        internshipName: "Cloud computing & storage",
        company: "NTI and ITIDA Summar Intern",
      ),
      Internship(
        date: "05/2022 – 07/2022",
        certificateLink: Uri.parse(
            "https://www.credly.com/badges/25b37b6b-ed81-42f7-b770-b64c4273a478"),
        internshipName: "CCNA: Enterprise Networking, Security, and Automation",
        company: "NTI Intern",
      ),
      Internship(
        date: "08/2020 – 10/2020",
        location: "Cairo, Egypt",
        internshipName: "Back-end development",
        company: "NajahNow and ITIDA Summar Intern",
        description:
            "o PHP o Laravel o Developing Server-Side Applications o Database Management o SQL o APIDevelopment o Security Implementation o Debugging and Troubleshooting",
      ),
    ];
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: internships.map((item) {
            return subjectRow(
              date: item.date,
              location: item.location ?? "",
              certificateLink: item.certificateLink ?? Uri.parse(""),
              internshipName: item.internshipName,
              company: item.company,
              description: item.description ?? "",
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget subjectRow({
    required String date,
    required String? location,
    required Uri? certificateLink,
    required String internshipName,
    required String company,
    required String? description,
  }) {
    return Row(
      children: [
        dateOfSubject(date: date, location: location ?? ""),
        const Spacer(flex: 2),
        Expanded(
          flex: 16,
          child: subjectDetails(
            internshipName: internshipName,
            certificateLink: certificateLink ?? Uri.parse(""),
            company: company,
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

  Widget subjectDetails({
    required String internshipName,
    required String company,
    Uri? certificateLink,
    String? description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        Text(
          internshipName,
          maxLines: 2, // Adjust maxLines if needed
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 8),
        Text(
          company,
          style: const TextStyle(fontStyle: FontStyle.italic),
          maxLines: null, // Allow the text to wrap fully
          overflow: TextOverflow.visible,
          // style: const TextStyle(fontSize: 18.0),
        ),
        certificateLink.toString().isNotEmpty
            ? TextButton(
                onPressed: () => _launchUrl(certificateLink!),
                child: const Text(
                  "Certificate Link",
                  maxLines: null, // Allow the text to wrap fully
                  overflow: TextOverflow.visible,
                  // style: const TextStyle(fontSize: 18.0),
                ),
              )
            : Text(
                description!,
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
