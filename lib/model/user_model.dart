class User {
  late String username;
  late String password;

  User({required this.password, required this.username});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String,dynamic> toJson()=>{
   'username':username,
   'password':password,
  };




}
