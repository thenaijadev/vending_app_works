import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinksProvider {
  static Future<String> createLinks(String params) async {
    final url = "https://com.example.vending_app_poc?params=$params";
    final Uri uri = Uri.parse(url);

    // If the feature does not work add  /65uK to the string of the link
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        androidParameters: const AndroidParameters(
            packageName: "com.example.vending_app_poc", minimumVersion: 0),
        link: uri,
        uriPrefix: "https://vend.page.link");

    final FirebaseDynamicLinks link = FirebaseDynamicLinks.instance;
    final refLink = await link.buildShortLink(parameters);
    log(refLink.shortUrl.toString());
    return refLink.shortUrl.toString();
  }

  // static Future<String> initDynamicLink() async {
  //   final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();
  //   if (instanceLink != null) {
  //     final Uri refLink = instanceLink.link;
  //     if (refLink.queryParameters.containsKey("params")) {
  //       return "This is the link: ${refLink.queryParameters["params"]}";
  //     }
  //     log("isnotnull");
  //   } else {
  //     return "no link";
  //   }

  //   return instanceLink.toString();
  // }

  static Future<String> getPassedParameters() async {
    // await DynamicLinksProvider.createLinks("");
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    // if (initialLink != null) {
    //   final Uri deepLink = initialLink.link;

    //   // Example of using the dynamic link to push the user to a different screen
    // }

    // Uri? deepLink;
    // FirebaseDynamicLinks.instance.onLink.listen(
    //   (pendingDynamicLinkData) {
    //     deepLink = pendingDynamicLinkData.link;
    //   },
    // );

    String theLink = "link Here";
    if (initialLink != null) {
      theLink = initialLink.link.toString();
      return theLink;
    }

    return null.toString();
  }
}
