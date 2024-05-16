class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String password;
  List<String> likedEvents;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.likedEvents,
  });

  // Convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': {'\$oid': id},
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'likedEvents': likedEvents,
    };
  }

  // Create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id']['\$oid'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      likedEvents: List<String>.from(json['likedEvents']),
    );
  }
}