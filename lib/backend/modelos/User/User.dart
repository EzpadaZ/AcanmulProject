class User {
  String email, name;
  User({this.email, this.name});

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json['email'],
    name: json['name']
  );
}