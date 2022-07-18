class Account{


  late String username;
  late String password;
 String email;
  Account({required this.password, required this.username,required this.email});

  Account.fromJson(Map<String, dynamic> json)
      : username = json['username'],
  email=json['email'],
        password = json['password'];

  Map<String,dynamic> toJson()=>{
    'username':username,
    'email':email,
    'password':password,
  };
}