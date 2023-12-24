class Branch {
  final String name;
  final String schedule;
  final String location;

  Branch({
    required this.name,
    required this.schedule,
    required this.location,
  });

  factory Branch.fromMap(Map<String, dynamic> data) {
    return Branch(
      name: data['name'] ?? '',
      schedule: data['schedule'] ?? '',
      location: data['location'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'schedule': schedule,
      'location': location,
    };
  }
}