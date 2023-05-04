import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vending_app_poc/bloc/uri_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import './utilities/firebase_options.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import './utilities/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await DynamicLinksProvider.createLinks("");
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  if (initialLink != null) {
    final Uri deepLink = initialLink.link;

    // Example of using the dynamic link to push the user to a different screen
  }

  Uri? deepLink;
  FirebaseDynamicLinks.instance.onLink.listen(
    (pendingDynamicLinkData) {
      deepLink = pendingDynamicLinkData.link;
    },
  );

  String theLink = "link Here";
  if (initialLink != null) {
    theLink = initialLink.link.toString();
  }

  runApp(MyApp(initialLink: theLink));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.initialLink});
  final String initialLink;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider<UriBloc>(
      create: (context) => UriBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
