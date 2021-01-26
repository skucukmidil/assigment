import 'dart:async';
import 'package:internative_assigment/models/user_model.dart';

class UserListBlock{
  List<UserModel> _users=[];

  final _userStateController=StreamController<List<UserModel>>();
  StreamSink<List<UserModel>> get _userStateSink=>_userStateController.sink;

  Stream<List<UserModel>> get users=>_userStateController.stream;

  final _userFetchController=StreamController<List<UserModel>>();
  Sink<List<UserModel>> get userFetchSink=>_userFetchController.sink;

  
  UserListBlock(){
    _userFetchController.stream.listen(_usersAddToState);
  }

  void _usersAddToState(List<UserModel> users){
    _users.addAll(users);

    _userStateSink.add(_users);
  }

  void importUsers(Future<List<UserModel>> users)async{
    userFetchSink.add(await users);
  }

  void dispose(){
    _userFetchController.close();
    _userStateController.close();
  }
}