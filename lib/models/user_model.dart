class UserModel{
  String name, avatarUrl, note, status, phone, mail, address;

  UserModel({this.avatarUrl, this.name, this.note, this.status, this.phone, this.mail, this.address});


  UserModel.fromMap({Map<String, dynamic> userMap}){
    name=userMap["name"];
    avatarUrl=userMap["avatarUrl"];
    note=userMap["note"];
    status=userMap["status"];
    phone=userMap["phone"];
    mail=userMap["mail"];
    address=userMap["address"];
  }
}