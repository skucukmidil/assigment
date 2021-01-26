import 'package:flutter/material.dart';

class UiModel{
  double screenWidth, screenHeight, screenTopPadding, screenBottomPadding;
  UiModel({this.screenWidth, this.screenHeight,this.screenTopPadding, this.screenBottomPadding});

  double get mainPageHorizontalPadding=>screenWidth*0.05;
  double get mainPageSubElementsWidth=>screenWidth-(mainPageHorizontalPadding*2);
  double get centerWidgetHeight=>screenHeight-(50+screenTopPadding+screenBottomPadding+50); //50px for appBarHeight and 50px for bottomBarHeight

  static Map<String, Color> colors={
    "background":Colors.white,
    "content":Colors.blueGrey[800],
  };

  final Map<String, TextStyle> textStyles={
    "appBarTitle":TextStyle(fontFamily: "Langar", fontWeight: FontWeight.w500, letterSpacing: 0.4, fontSize: 19.5, color: colors["content"]),
    "userName":TextStyle(fontFamily: "Langar", fontWeight: FontWeight.w400, letterSpacing: 0.2, fontSize: 17.5, color: colors["content"]),
    "userNote":TextStyle(fontFamily: "RobotoSlab", fontWeight: FontWeight.w600, letterSpacing: 0.4, fontSize: 15.0, color: colors["content"]),
    "userScreenTitle":TextStyle(fontFamily: "Langar", fontWeight: FontWeight.w400, letterSpacing: 0.27, fontSize: 16.5, color: colors["content"]),
    "userScreenInfo":TextStyle(fontFamily: "RobotoSlab", fontWeight: FontWeight.w600, letterSpacing: 0.2, fontSize: 14.0, color: colors["content"]),
    "userSingularPageTitle":TextStyle(fontFamily: "Langar", fontWeight: FontWeight.w600, letterSpacing: 1, fontSize: 18.5, color: colors["content"]),
    "userSingularPageInfo":TextStyle(fontFamily: "RobotoSlab", fontWeight: FontWeight.w800, letterSpacing: 0.7, fontSize: 15.5, color: colors["content"]),
  };


  Widget getMainPage({List<Widget> pageParts})=>Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: pageParts,
                ),
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: mainPageHorizontalPadding),
              ),
              left: false,
              right: false,
            ),
            color: colors["background"]
        ),
      )
  );

  Widget getIconButton({IconData icon, Function onPressed})=>GestureDetector(child: Icon(icon, color: colors["content"]), onTap: onPressed);

  Container getAppBar({String title, IconData icon, Widget backButton})=>Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            (backButton==null)?Icon(icon, color: colors["content"], size: 30):backButton,
            SizedBox(width: 10.0),
            Expanded(child: Text(title, style: textStyles["appBarTitle"], textAlign: TextAlign.left, overflow: TextOverflow.ellipsis))
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        SizedBox(height: 5.0),
        Divider(color: colors["content"], height: 0.0)
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    ),
    height: 50.0,
    width: double.infinity,
  );

  Container getPageCenterContainer({List<Widget> pageElements})=>Container(
      child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: pageElements,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
            ),
          )
      ),
      height: centerWidgetHeight
  );

  Container get bottomBar=>Container(
      child: Column(
        children: <Widget>[
          Divider(color: colors["content"], height: 0.0)
        ],
      ),
      height: 50.0
  );

  Widget getRoundedNetworkImage({String url, double width, double height, double roundRadius})=>ClipRRect(
      child: Image.network(
          url,
          loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ?
                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
          width: width,
          height: height
      ),
      borderRadius: BorderRadius.circular(roundRadius)
  );
}