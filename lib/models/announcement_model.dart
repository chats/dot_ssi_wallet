class Announcement {
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime? expiryDate;
  final String? imageUrl;

  Announcement({
    required this.title,
    required this.description,
    required this.startDate,
    this.expiryDate,
    this.imageUrl,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      expiryDate: json['expiryDate'] != null
          ? DateTime.parse(json['expiryDate'])
          : null,
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'expiryDate': expiryDate?.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }
}
