

import 'package:flutter/material.dart';
import 'package:frank_martin/pages/start/start_page.dart';
import 'package:tetris_blocs/core/tetris_event.dart';
import 'package:tetris_blocs/core/tetris_provider.dart';

import 'login_bloc.dart';

class LoggedOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("You have been logged out"),
            FlatButton(
              onPressed: () async {
                  TetrisProvider.of<LoginBloc>(context).dispatch(TetrisEvent.withAction(action: LoginBloc.PERFORM_LOGIN));
                  await Future.delayed(Duration(seconds: 2), () => Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => StartPage(),
                    ),
                  ));

                },
              child:Text("Log in")
            )
          ],
        ),
      ),
    );
  }

}
