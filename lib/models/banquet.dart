class BanquetPackage{
  final String? id;
  final String name;
  final double rate;
  final List<String> points;

  BanquetPackage({this.id, required this.name, required this.rate, required this.points});

  factory BanquetPackage.fromMap(Map<String, dynamic> data, String documentId){
    return BanquetPackage(
        id: documentId,
        name: data['name'],
        rate: data['rate'].toDouble(),
        points: List<String>.from(data['points']),
    );
  }
}

class Banquet {
  final String? id;
  final String name;
  final String area;
  final String city;
  final String country;
  final String description;
  final String coverImage;
  final String minRate;
  final List<String> images;
  List<BanquetPackage> banquetPackages;

  Banquet(
      {this.id,
        required this.name,
      required this.area,
      required this.city,
      required this.country,
      required this.description,
      required this.coverImage,
      required this.minRate,
      required this.images,
      this.banquetPackages= const [],
      });

  factory Banquet.fromMap(Map<String, dynamic> data, String documentId) {
    return Banquet(
        id: documentId,
        name: data['name'] ?? '',
        area: data['area'] ?? '',
        city: data['city'] ?? '',
        country: data['country'] ?? '',
        coverImage: data['imageUrl'] ?? '',
        description: data['description'] ?? '',
        minRate: data['minRate'] ?? '',
        images: List<String>.from(data['imagesUrls']),
    );
  }

  void setBanquetPackages(List<BanquetPackage> items){
    banquetPackages=items;
  }
}
