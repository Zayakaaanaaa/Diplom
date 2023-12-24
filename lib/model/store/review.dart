class Review {
  final String authorName;
  final String content;
  final double rating;
  final DateTime date;
  final int likes;

  Review({
    required this.authorName,
    required this.content,
    required this.rating,
    required this.date,
    required this.likes,
  });

  factory Review.fromMap(Map<String, dynamic> data) {
    return Review(
      authorName: data['authorName'] ?? '',
      content: data['content'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      date: DateTime.fromMillisecondsSinceEpoch(data['date'] ?? 0),
      likes: data['likes'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authorName': authorName,
      'content': content,
      'rating': rating,
      'date': date.millisecondsSinceEpoch,
      'likes': likes,
    };
  }
}
