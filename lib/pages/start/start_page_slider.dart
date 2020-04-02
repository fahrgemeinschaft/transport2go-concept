import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/pages/login/login_bloc.dart';
import 'package:frank_martin/pages/presentation/presentation_page.dart';
import 'package:tetris_blocs/core/tetris_event.dart';
import 'package:tetris_blocs/core/tetris_provider.dart';

class StartPageSlider extends StatefulWidget {
  StartPageSlider({Key key}) : super(key: key);

  @override
  _StartPageSliderState createState() => _StartPageSliderState();
}

class _StartPageSliderState extends State<StartPageSlider> {

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = TetrisProvider.of<LoginBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 5),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/images/transport2go_icon_full.png'),
                  ),
                  Text(
                    "Transport2Go",
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              height: 5,
              margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            ListTile(
              leading: Icon(MaterialCommunityIcons.login),
              title: Text(
                  "Anmelden"
              ),
              onTap: () {
                loginBloc.dispatch(TetrisEvent.withAction(action: LoginBloc.PERFORM_LOGIN));
              },
            ),
            ListTile(
              leading: Icon(FontAwesome5Solid.hand_holding_heart),
              title: Text(
                  "Einführung"
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PresentationPage()));
              },
            ),
            Container(
              width: 120,
              height: 5,
              margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            ListTile(
              leading: Icon(MaterialIcons.feedback),
              title: Text(
                  "Feedback"
              ),
            ),
            ListTile(
              leading: Icon(Ionicons.md_paper),
              title: Text(
                  "Legal"
              ),
            ),
            Container(
              width: 120,
              height: 5,
              margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            ListTile(
              leading: FlutterLogo(),
              title: Text(
                  "Built with Flutter"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
