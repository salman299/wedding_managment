class BanquetOrderItem {
  final String? id;
  final String banquetId;
  final String contactNo;
  final String date;
  final String invitations;
  final String otherDetails;
  final String packageId;
  final String price;

  BanquetOrderItem(
      {this.id,
      required this.banquetId,
      required this.contactNo,
      required this.date,
      required this.invitations,
      required this.otherDetails,
      required this.packageId,
      required this.price});

  factory BanquetOrderItem.fromMap(
      Map<String, dynamic> data, String documentId) {
    return BanquetOrderItem(
      banquetId: data['banquetId'],
      contactNo: data['contactNo'],
      date: data['date'],
      invitations: data['invitations'],
      otherDetails: data['otherDetails'],
      packageId: data['packageId'],
      price: data['price'],
    );
  }

  Map toJson() => {
        'banquetId': banquetId,
        'contactNo': contactNo,
        'date': date,
        'invitations': invitations,
        'otherDetails': otherDetails,
        'packageId': packageId,
        'price': price,
      };
}

class ProductOrderItem {
  final String? productId;
  final String title;
  final double price;
  final int quantity;

  ProductOrderItem(
      {this.productId,
      required this.title,
      required this.price,
      required this.quantity});

  factory ProductOrderItem.fromMap(Map<String, dynamic> data) {
    return ProductOrderItem(
      productId: data['id'],
      price: data['price'],
      quantity: data['quantity'],
      title: data['title'],
    );
  }

  Map toJson() => {
        'productId': productId,
        'quantity': quantity,
        'title': title,
        'price': price,
      };
}

class InvitationCardOrderItem {
  final String? id;
  final String invitationCardID;
  final String address;
  final String brideName;
  final String groomName;
  final String contactNo;
  final String email;
  final String invitations;
  final String price;
  final String otherDetails;

  InvitationCardOrderItem(
      {this.id,
      required this.invitationCardID,
      required this.contactNo,
      required this.address,
      required this.brideName,
      required this.groomName,
      required this.email,
      required this.invitations,
      required this.price,
      required this.otherDetails});

  factory InvitationCardOrderItem.fromMap(
      Map<String, dynamic> data, String documentId) {
    return InvitationCardOrderItem(
      invitationCardID: data['invitationCardId'],
      contactNo: data['contactNo'],
      email: data['email'],
      address: data['address'],
      brideName: data['brideName'],
      groomName: data['groomName'],
      invitations: data['invitations'],
      otherDetails: data['otherDetails'],
      price: data['price'],
    );
  }

  Map toJson() => {
    'invitationCardId': invitationCardID,
    'contactNo':contactNo,
    'email':email,
    'address':address,
    'brideName':brideName,
    'groomName':groomName,
    'invitations':invitations,
    'otherDetails':otherDetails,
    'price':price,
  };

}


class PhotographerOrderItem {
  final String? id;
  final String photographerId;
  final String noOfPhotographers;
  final String hours;
  final String contactNo;
  final String price;
  final String otherDetails;

  PhotographerOrderItem(
      {this.id,
        required this.photographerId,
        required this.noOfPhotographers,
        required this.contactNo,
        required this.hours,
        required this.price,
        required this.otherDetails});

  factory PhotographerOrderItem.fromMap(
      Map<String, dynamic> data, String documentId) {
    return PhotographerOrderItem(
      photographerId: data['photographerId'],
      contactNo: data['contactNo'],
      noOfPhotographers: data['noOfPhotographers'],
      hours: data['hours'],
      otherDetails: data['otherDetails'],
      price: data['price'],
    );
  }

  Map toJson() => {
    'photographerId': photographerId,
    'contactNo':contactNo,
    'noOfPhotographers':noOfPhotographers,
    'hours':hours,
    'otherDetails':otherDetails,
    'price':price,
  };

}

class RentCarOrderItem {
  final String? id;
  final String rentCarId;
  final String date;
  final String days;
  final String address;
  final String city;
  final String contactNo;
  final String price;
  final String otherDetails;

  RentCarOrderItem(
      {this.id,
        required this.rentCarId,
        required this.date,
        required this.days,
        required this.contactNo,
        required this.address,
        required this.city,
        required this.price,
        required this.otherDetails});

  factory RentCarOrderItem.fromMap(
      Map<String, dynamic> data, String documentId) {
    return RentCarOrderItem(
      rentCarId: data['rentCarId'],
      date: data['date'],
      days: data['days'],
      address: data['address'],
      city: data['city'],
      contactNo: data['contactNo'],
      price: data['price'],
      otherDetails: data['otherDetails'],
    );
  }

  Map toJson() => {
    'rentCarId': rentCarId,
    'date':date,
    'days':days,
    'address':address,
    'city': city,
    'contactNo':contactNo,
    'price':price,
    'otherDetails': otherDetails,
  };

}

class OrderItem {
  final String? id;
  List<ProductOrderItem> products;
  BanquetOrderItem? banquet;
  InvitationCardOrderItem? invitationCard;
  PhotographerOrderItem? photographerOrderItem;
  RentCarOrderItem? rentCarOrderItem;

  OrderItem({this.id, required this.products, required this.banquet, required this.invitationCard});
}
