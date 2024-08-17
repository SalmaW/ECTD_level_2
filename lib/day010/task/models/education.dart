class Education {
  final String date;
  final String location;
  final String title;
  final String institution;
  final String? description;

  Education({
    required this.date,
    required this.location,
    required this.title,
    required this.institution,
    this.description,
  });
}
