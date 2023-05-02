import 'package:url_launcher/url_launcher.dart';

class URLlauncher {
  URLlauncher({
    required this.urlLink,
  });
  final String urlLink;

  Uri get _url {
    return Uri.parse(urlLink);
  }

  Future<void> launch() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
