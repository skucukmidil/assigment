import 'package:flutter/material.dart';
import 'components.dart';
import '../../models/user_model.dart';

// ignore: must_be_immutable
class UserScreen extends StatelessWidget {
  Components components;
  UserModel user;

  UserScreen({this.user});

  @override
  Widget build(BuildContext context) {
    components=Components(screenWidth: MediaQuery.of(context).size.width, screenHeight: MediaQuery.of(context).size.height, screenTopPadding: MediaQuery.of(context).padding.top, screenBottomPadding: MediaQuery.of(context).padding.bottom);
    return components.getMainPage(
        pageParts: getPageParts(context)
    );
  }

  List<Widget> getPageParts(BuildContext context)=>[
    components.getAppBar(title: user.name, backButton: components.getIconButton(icon: Icons.arrow_back_ios, onPressed: ()=>Navigator.pop(context)), icon: null),
    components.getCenterContainer(pageElements: pageElements),
    components.bottomBar
  ];

  List<Widget> get pageElements=>[
    components.getUserImageAndStatus(avatarUrl: user.avatarUrl, status: user.status),
    components.getUserPhoneContainer(phone: user.phone),
    SizedBox(height: 10.0),
    components.getUserMailContainer(mail: user.mail),
    SizedBox(height: 10.0),
    components.getUserAddressContainer(address: user.address),
  ];
}
