class User {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final String image;
  final double lat;
  final double lng;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.image,
    required this.lat,
    required this.lng,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['ID'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['full_name'] ?? "My Name",
      image: json['image'] as String,
      lat: double.parse(json['lat'] as String),
      lng: double.parse(json['lng'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'full_name': fullName,
      'image': image,
      'lat': lat.toString(),
      'lng': lng.toString(),
    };
  }
}
