import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class NavigationService {
 late GlobalKey<NavigatorState> _navigatorKey;

final Map<String, Widget Function(BuildContext)> _routes = {
"/login": (context) => LoginPage(),
"/register" : (context) => RegisterPage(),
"/home": (context) => Homepage(),

};


GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

Map<String, Widget Function(BuildContext)> get routes => _routes;

NavigationService(){
  _navigatorKey = GlobalKey<NavigatorState>();
}

//push 
void pushNamed(String routeName){
  _navigatorKey.currentState?.pushNamed(routeName);
}
//pop
void pushReplacementNamed(String routeName){
  _navigatorKey.currentState?.pushReplacementNamed(routeName);
}

void goBack(){
  _navigatorKey.currentState?.pop();
}

void push(MaterialPageRoute route){
  _navigatorKey.currentState?.push(route);
}

}
