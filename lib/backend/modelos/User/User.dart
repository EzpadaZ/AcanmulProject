class User {
  String email, name, token;
  int role;

  User({this.email, this.name, this.role, this.token});

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json['email'],
    name: json['name'],
    token: json['token'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'token': token,
    'role': role
  };

  String getNombre(){
    return name;
  }
}