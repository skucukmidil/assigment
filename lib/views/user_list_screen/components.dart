import 'package:flutter/material.dart';
import '../../models/ui_model.dart';

class Components{
  UiModel ui;

  Components({double screenWidth, double screenHeight,double screenTopPadding, double screenBottomPadding}){
    ui=UiModel(screenWidth: screenWidth, screenHeight: screenHeight, screenTopPadding: screenTopPadding, screenBottomPadding: screenBottomPadding);
  }

  Widget getMainPage({List<Widget> pageParts})=>ui.getMainPage(pageParts: pageParts);
  Widget getCenterContainer({List<Widget> pageElements})=>ui.getPageCenterContainer(pageElements: pageElements);
  Widget getIconButton({IconData icon, Function onPressed})=>ui.getIconButton(icon: icon, onPressed: onPressed);
  Widget get appBar=>ui.getAppBar(title: "Kullanıcılar", icon: Icons.person_pin, backButton: null);
  Container get bottomBar=>ui.bottomBar;

  Widget getUserImage({String avatarUrl, double width, double height, double borderRadius})=>ui.getRoundedNetworkImage(url: avatarUrl, height: 50.0, width: 50.0, roundRadius: 12.0);

  double get userNameAndNoteDividerEndIndent=>(ui.mainPageSubElementsWidth-50)*0.3;
  Widget getUserNameAndNoteContainer({String name, String note})=>Container(
      child: Column(
        children: <Widget>[
          Expanded(child: Text(name, style: ui.textStyles["userName"], overflow: TextOverflow.ellipsis)),
          Expanded(child: Text(" -"+note, style: ui.textStyles["userNote"], textAlign: TextAlign.center, overflow: TextOverflow.clip))
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start
      ),
          height: 50,
  );

  Widget getUserContainer({String name, String avatarUrl, String note, Function onTap})=>GestureDetector(
    child: Container(
      child: Row(
        children: <Widget>[
          getUserImage(avatarUrl: avatarUrl),
          SizedBox(width: 5.0),
          getUserNameAndNoteContainer(name: name, note: note)
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      margin: EdgeInsets.only(bottom: 10.0),
      width: double.infinity
    ),
    onTap: onTap
  );

}
