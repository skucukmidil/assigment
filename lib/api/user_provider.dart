import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserProvider{
  UserProvider();
  Future<List<UserModel>> getUserList()async{
    var response=await http.get("https://raw.githubusercontent.com/skucukmidil/testRepo/main/test_users.json");

    if(response.statusCode==200){
      Map<String, dynamic> userMap=json.decode(response.body);

      return List<UserModel>.generate(userMap.length, (i)=>UserModel.fromMap(userMap: userMap[i.toString()]));
    }

    return [];
  }
}