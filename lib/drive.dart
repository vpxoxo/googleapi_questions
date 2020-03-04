import 'dart:io';
import 'package:googleapi_questions/secure_storage.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import "package:googleapis_auth/auth_io.dart";
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

const _clientID = 'CLIENT-ID';

const _clientSecret = 'SECRET';

const _scopes = [ga.DriveApi.DriveFileScope];

class GoogleDrive {
  final storage = SecureStorage();

  Future<http.Client> getHttpClient() async {
    var credentials = await storage.getCredentials();
    if (credentials == null) {
      var authClient = await clientViaUserConsent(
          ClientId(_clientID, _clientSecret), _scopes, (url) {
        launch(url);
      });
      await storage.saveCredentials(authClient.credentials.accessToken,
          authClient.credentials.refreshToken);
      return authClient;
    } else {
      print(credentials["expiry"]);
      return authenticatedClient(
          http.Client(),
          AccessCredentials(
              AccessToken(credentials['type'], credentials['data'],
                  DateTime.tryParse(credentials['expiry'])),
              credentials['refreshToken'],
              _scopes));
    }
  }

  Future upload(File file) async {
    var client = await getHttpClient();
    var drive = ga.DriveApi(client);
    print("Uploading file");
    var response = await drive.files.create(
        ga.File()..name = p.basename(file.absolute.path),
        uploadMedia: ga.Media(file.openRead(), file.lengthSync()));
    print(response.toJson());
  }
}
