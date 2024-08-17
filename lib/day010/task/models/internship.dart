class Internship {
  final String date;
  final String? location;
  final Uri? certificateLink;
  final String internshipName;
  final String company;
  final String? description;

  Internship({
    required this.date,
    required this.internshipName,
    required this.company,
    this.location,
    this.certificateLink,
    this.description,
  });
}
