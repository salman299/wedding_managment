class Photographer {
  final String? id;
  final String title;
  final double rate;
  final String coverImage;
  final String description;
  final List<String> images;
  final List<String> details;

  Photographer(
      {this.id,
      required this.title,
      required this.rate,
      required this.coverImage,
      required this.images,
        required this.description,
        required this.details});

  factory Photographer.fromMap(Map<String, dynamic> data, String documentId) {
    return Photographer(
      id: documentId,
      title: data['title'],
      rate: data['rate'].toDouble(),
      description: data['description'],
      coverImage: data['coverImage'],
      images: List<String>.from(data['images']),
      details: List<String>.from(data['details']),
    );
  }
}
