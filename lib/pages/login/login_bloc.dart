import 'package:tetris_blocs/core/tetris_bloc.dart';
import 'package:tetris_blocs/core/tetris_event.dart';

import 'oauth_login.dart';

class LoginBloc extends TetrisBloc {
  static const String LOGGED_OUT="LOGGED_OUT";

  static const String LOGGED_IN="LOGGED_IN";

  static const String PERFORM_LOGIN = "PERFORM_LOGIN";

  static const String UPDATE_ID_TOKEN="UPDATE_ID_TOKEN";
  static const String DELETE_ID_TOKEN="DELETE_ID_TOKEN";
  static const String GET_ID_TOKEN="GET_ID_TOKEN";

  var idToken;

  @override
  Stream<TetrisEvent> processEvent(TetrisEvent event) async* {
    print("processEvent="+event.action.toString());

    switch(event.action){
      case PERFORM_LOGIN:
        await OAuthLogin().login();
        yield TetrisEvent.withAction(action: LOGGED_IN);
        return;

      case UPDATE_ID_TOKEN:
        this.idToken = event.payload;
        yield TetrisEvent.withAction(action: LOGGED_IN);
        return;

      case DELETE_ID_TOKEN:
        this.idToken = null;
        yield TetrisEvent.withAction(action: LOGGED_OUT);
        return;

      case GET_ID_TOKEN:
        yield TetrisEvent.withPayload (action: GET_ID_TOKEN, payload: this.idToken);
        return;
    }
    yield TetrisEvent.withAction(action: LOGGED_OUT);
  }

}