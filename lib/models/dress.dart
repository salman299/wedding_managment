class Dress {
  final String? id;
  final String title;
  final double rate;
  final String brand;
  final String description;
  final String coverImage;
  final List<String> sizes;
  final List<String> colors;
  final List<String> images;

  Dress(
      {this.id,
        required this.title,
        required this.brand,
        required this.description,
        required this.rate,
        required this.coverImage,
        required this.images,
        required this.sizes,
        required this.colors,
        });

  factory Dress.fromMap(Map<String, dynamic> data, String documentId) {
    return Dress(
      id: documentId,
      brand: data['brand'],
      description: data['description'],
      title: data['title'],
      rate: data['rate'].toDouble(),
      coverImage: data['coverImage'],
      colors:List<String>.from(data['colors']),
      sizes: List<String>.from(data['sizes']),
      images: List<String>.from(data['images']),
    );
  }
}
