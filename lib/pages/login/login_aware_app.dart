

import 'package:flutter/material.dart';
import 'package:tetris_blocs/tetris_blocs.dart';

import 'logged_out_page.dart';
import 'login_bloc.dart';

class LoginAwareApp extends StatelessWidget {
  final MaterialApp child;

  final String loginAppTitle;

  final ThemeData loginAppTheme;


  LoginAwareApp({this.child, this.loginAppTitle, this.loginAppTheme});

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = TetrisProvider.of<LoginBloc>(context);
    return TetrisBuilder(
        blocs: [loginBloc],
        builder: (BuildContext context, TetrisEvent event) {
          print("build event="+event.action.toString());

          if(LoginBloc.LOGGED_OUT == event.action){
            return buildMaterialApp(loginBloc,LoggedOutPage());
          }else if(LoginBloc.LOGGED_IN == event.action){
            return child;
          }
          return buildMaterialApp(loginBloc,LoggedOutPage());
        }
    );
  }

  Widget buildMaterialApp(LoginBloc loginBloc, Widget home){
    return MaterialApp(
      title: loginAppTitle,
      theme: loginAppTheme,
      home: home,
      onUnknownRoute:onUnknownRoute,
      onGenerateRoute: (RouteSettings requestedRoute){
    //    print("onGenerateRoute route = "+requestedRoute.name.toString());

        List<String> parts =  requestedRoute.name.split("&");
     //   print("PARTS LEN>>"+parts.length.toString()+"<<");
        parts.forEach((element) {
      //    print("PART >>"+element+"<<");
          if(element.startsWith("id_token")){
            String idToken = element.substring("id_token=".length,element.length);
            loginBloc.dispatch(TetrisEvent.withPayload(action: LoginBloc.UPDATE_ID_TOKEN,payload: idToken));
          }
        });

        //this brings werid error
        //return MaterialPageRoute(settings: RouteSettings(name: "/"));
        //this naviagetr to / <- with exepction, but working. so keeo it working.
        return null;
      },

    );
  }

    Route<dynamic> onUnknownRoute(RouteSettings settings){
      print("onUnknownRoute route = "+settings.name.toString());
      return null;
    }


}
