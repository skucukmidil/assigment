import 'package:flutter/material.dart';
import 'views/user_list_screen/user_list_screen.dart';
import 'views/user_screen/user_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>MaterialApp(
    title: 'App',
    theme: theme,
    initialRoute: '/',
    onGenerateRoute: (RouteSettings settings){
      print(settings.name.toString());
      switch (settings.name) {
        case '/userScreen':return PageRouteBuilder(
            pageBuilder: (context, animation, anotherAnimation) {
              return UserScreen(user: settings.arguments);
              },
            transitionDuration: Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation( curve: Curves.bounceIn, parent: animation);
              return Align(
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: child,
                    axisAlignment: 0.0,
                  ));
            });
        default:
          return MaterialPageRoute(
            builder: (BuildContext context) => UserListScreen(),
            settings: settings,
          );
      }
    },
  );

  ThemeData get theme=>ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.blueGrey[800],
    hintColor: Colors.white,
    dividerColor: Colors.blueGrey[800],
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black
  );

}