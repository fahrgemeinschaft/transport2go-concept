
import 'package:openid_client/openid_client_browser.dart';


class OAuthLogin {

  static String KEYCLOAK_SSO_URL = "";

  Future<String> login() async {
    print("perform login");
//create the client
    var issuer = await Issuer.discover(Uri.parse(KEYCLOAK_SSO_URL));
    var client = new Client(issuer, "director");
    List<String> scopes = List();
    // create an authenticator
    var authenticator = new Authenticator(client, scopes: scopes);
    // create an implicit authentication flow
    var f = new Flow.implicit(client);

    // or an explicit flow
    f = new Flow.authorizationCode(client);

    // set the redirect uri
    f.redirectUri = Uri.parse("http://localhost");
    // get the credential
    var c = await authenticator.credential;

    if (c==null) {
    // starts the authentication
      print("perform authorize");

      authenticator.authorize(); // this will redirect the browser
    } else {
    // return the user info
    //return await c.getUserInfo();
    }

  }

}
