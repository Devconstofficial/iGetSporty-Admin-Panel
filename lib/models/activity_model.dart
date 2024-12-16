class Activity {
  final String title;
  final String description;
  final String timestamp;
  final String? icon;

  Activity({
    required this.title,
    required this.description,
    required this.timestamp,
    this.icon,
  });
}
