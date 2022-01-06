class RentCar {
  final String? id;
  final String title;
  final double rate;
  final String coverImage;
  final String description;
  final List<String> details;
  final List<String> images;

  RentCar(
      { this.id,
        required this.title,
        required this.rate,
        required this.coverImage,
        required this.images,
        required this.details,
        required this.description,
        });

  factory RentCar.fromMap(Map<String, dynamic> data, String documentId) {
    return RentCar(
      id: documentId,
      title: data['title'],
      rate: data['rate'].toDouble(),
      description: data['description'],
      coverImage: data['coverImage'],
      details: List<String>.from(data['details']),
      images: List<String>.from(data['images']),
    );
  }
}
