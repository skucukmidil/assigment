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
  Widget getAppBar({String title, IconData icon, Widget backButton})=>ui.getAppBar(title: title, icon: icon, backButton: backButton);
  Container get bottomBar=>ui.bottomBar;

  Container getPageTitleContainer({String title})=>Container(child: Text(title, style: ui.textStyles["userScreenTitle"], overflow: TextOverflow.ellipsis, textAlign: TextAlign.left), width: double.infinity, margin: EdgeInsets.only(top: 20.0),);
  Container getPageInfoContainer({String info})=>Container(child: Text(info, style: ui.textStyles["userScreenInfo"], overflow: TextOverflow.clip, textAlign: TextAlign.center), width: double.infinity);
  Container getPageSingularTitle({String title})=>Container(child: Text(title, style: ui.textStyles["userSingularPageTitle"], overflow: TextOverflow.ellipsis, textAlign: TextAlign.center), width: ui.mainPageSubElementsWidth*0.5);
  Container getPageSingularInfo({String info})=>Container(child: Text(info, style: ui.textStyles["userSingularPageInfo"], overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),  width: ui.mainPageSubElementsWidth*0.8);
  Container getPageSingularAddressTitle({String title})=>Container(child: Text(title, style: ui.textStyles["userSingularPageTitle"], overflow: TextOverflow.ellipsis, textAlign: TextAlign.center), width: ui.mainPageSubElementsWidth);
  Container getPageSingularAddress({String address})=>Container(child: Text(address, style: ui.textStyles["userSingularPageInfo"], overflow: TextOverflow.clip, textAlign: TextAlign.center),  width: ui.mainPageSubElementsWidth);


  Widget getUserImageAndStatus({String avatarUrl, String status})=>Container(
    child: Row(
      children: <Widget>[
        getUserImage(url: avatarUrl),
        getUserStatusContainer(status: status)
      ],
    ),
    width: double.infinity
  );

  double get userImageSize=>ui.mainPageSubElementsWidth*0.3;
  Widget getUserImage({String url})=>ui.getRoundedNetworkImage(url: url, width: userImageSize, height: userImageSize, roundRadius: userImageSize*0.12);

  Widget getUserStatusContainer({String status})=>Container(
    child: Column(
      children: <Widget>[
        getPageTitleContainer(title: "Kullanıcı Durum"),
        Divider(height: 0.0, endIndent: (ui.mainPageSubElementsWidth*0.7)*0.3),
        SizedBox(height: 10.0),
        getPageInfoContainer(info: status),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    ),
    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
    width: ui.mainPageSubElementsWidth*0.7,
    height:  ui.mainPageSubElementsWidth*0.4,
  );

  Divider get singularTitleDivider=>Divider(height: 5.0, endIndent: ui.mainPageSubElementsWidth*0.5);

  Widget getUserPhoneContainer({String phone})=>Container(
    child: Column(
      children: <Widget>[
        getPageSingularTitle(title: "Telefon"),
        singularTitleDivider,
        getPageSingularInfo(info: phone),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
  );


  Widget getUserMailContainer({String mail})=>Container(
    child: Column(
      children: <Widget>[
        getPageSingularTitle(title: "Mail"),
        singularTitleDivider,
        getPageSingularInfo(info: mail)
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
  );


  Divider get addressDivider=>Divider(height: 5.0, endIndent: ui.mainPageSubElementsWidth*0.25, indent: ui.mainPageSubElementsWidth*0.25);

  Widget getUserAddressContainer({String address})=>Container(
    child: Column(
      children: <Widget>[
        getPageSingularAddressTitle(title: "Adres"),
        addressDivider,
        getPageSingularAddress(address: address)
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
  );


}