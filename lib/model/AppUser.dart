class AppUser{
  String userId;
  String Name;
  String Email;
  String password;
  AppUser({this.userId,this.Email,this.Name,this.password});
  AppUser.fromMap(Map map){
    this.password=map['password']??'';
    this.Email=map['Email']??'';
    this.Name=map['Name']??'';
    this.userId=map['userId']??'';
  }
  toJson(){
    return {
      'password':this.password,
      'userId':this.userId,
      'Email':this.Email,
      'Name':this.Name,






    };
  }
}