import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frank_martin/pages/start/start_page.dart';
import 'package:tetris_blocs/tetris_blocs.dart';

import 'pages/login/login_bloc.dart';

void main() => runApp(App());
//Some foo to ensure providers are injected properly...
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TetrisProvider(
        blocs: [
          LoginBloc()
        ],
        child: MyApp()
    );
  }

}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the sub-root of your application.

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp(context);
    //return LoginAwareApp(child: buildMaterialApp(context), loginAppTheme: ThemeData.light(), loginAppTitle: 'Login');
  }

  Widget buildMaterialApp(BuildContext context) {
    LoginBloc loginBloc = TetrisProvider.of<LoginBloc>(context);

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale('de'),
        supportedLocales: [
          const Locale('de'), // German
          // ... other locales the app supports
        ],

    //  theme: AppTheme.createTheme(),

      /*
      home: SplashScreen(
        imageAssetName: 'assets/images/logo.png',
        seconds: 3,
        navigateTo: new TabContainer(),
      ),
      */

      /*
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () => loginBloc.dispatch(TetrisEvent.withAction(action:LoginBloc.DELETE_ID_TOKEN)),
              icon: Icon(Icons.lock),
              label: Text("Logout")
            )
          ],
        ),
        body: Text("Fixme"),
      ),
       */

      home: StartPage()
    );
  }



}
