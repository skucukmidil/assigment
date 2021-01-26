import 'dart:async';
import 'package:flutter/material.dart';
import 'components.dart';
import '../../models/user_model.dart';
import '../../bloc/user_list_bloc.dart';
import '../../api/user_provider.dart';
import '../../views/user_screen/user_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final _bloc=UserListBlock();

  Components components;

  @override
  void initState() {
    // TODO: implement initState
    _bloc.importUsers(UserProvider().getUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    components=Components(screenWidth: MediaQuery.of(context).size.width, screenHeight: MediaQuery.of(context).size.height, screenTopPadding: MediaQuery.of(context).padding.top, screenBottomPadding: MediaQuery.of(context).padding.bottom);
    return components.getMainPage(
      pageParts: pageParts
    );
  }

  List<Widget> get pageParts=>[
    components.appBar,
    StreamBuilder(
        stream: _bloc.users,
        builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          if(!snapshot.hasData){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
              width: double.infinity,
              height: components.ui.centerWidgetHeight,
            );
          }

          return components.getCenterContainer(pageElements: [SizedBox(height: 10.0)]..addAll(List<Widget>.generate(snapshot.data.length, (i)=>components.getUserContainer(name: snapshot.data[i].name, avatarUrl: snapshot.data[i].avatarUrl, note: snapshot.data[i].note, onTap: ()=>Navigator.pushNamed(context, "/userScreen", arguments: snapshot.data[i])))));
        },
    ),
    components.bottomBar
  ];

}

