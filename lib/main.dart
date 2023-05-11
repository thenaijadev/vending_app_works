import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vending_app_poc/bloc/uri_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vending_app_poc/utilities/services/dynamic_link_provider.dart';
import './utilities/firebase_options.dart';
import './utilities/app_router.dart';
import './bloc/bloc/stocks_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final String theLink = await DynamicLinksProvider.getPassedParameters();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<UriBloc>(
          create: (context) => UriBloc(),
        ),
        BlocProvider<StocksBloc>(
          create: (context) => StocksBloc(),
        ),
      ],
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
