class InvitationCard {
  final String? id;
  final String title;
  final int packs;
  final double rate;
  final String coverImage;
  final List<String> images;
  final List<String> details;

  InvitationCard(
      {this.id,
      required this.title,
      required this.packs,
      required this.rate,
      required this.coverImage,
      required this.images,
        required this.details});

  factory InvitationCard.fromMap(Map<String, dynamic> data, String documentId) {
    print(data);
    return InvitationCard(
      id: documentId,
      title: data['title'],
      packs: data['packs'],
      rate: data['rate'].toDouble(),
      coverImage: data['coverImage'],
      images: List<String>.from(data['images']),
      details: List<String>.from(data['details']),
    );
  }
}
