// ignore_for_file: non_constant_identifier_names

class User 
{

  int id;
  String username;
  String email;
  String phone;
  String user_paswword;
  String conf_password;
  
  


  User
  (
    this.id,
    this.username,
    this.email,
     this.phone,
    this.user_paswword,
    this.conf_password,
    

  );

  factory User.fromJson(Map<String, dynamic> json) => User
  (
    int.parse(json["id"]),
    json["username"],
    json["email"],
    json["phone"],
    json["user_password	"],
    json["conf_password"],
  );

  Map<String, dynamic> toJson() => 
  {
    'id': id.toString(),
    'username':username,
    'email': email,
    'phone': phone,
    'user_password': user_paswword,
    'conf_password': conf_password,
    


  }; 

}


