import 'package:flutter/material.dart';
import 'package:navigator_routing/pages/another_page.dart';
import 'package:navigator_routing/pages/home_page.dart';
import 'package:navigator_routing/pages/not_found_page.dart';
import 'package:navigator_routing/pages/replacement_page.dart';
import 'package:navigator_routing/pages/return_data_page.dart';
import 'package:navigator_routing/pages/second_page.dart';
import 'package:navigator_routing/pages/with_data_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const SecondPage(),
        '/with-data': (context) =>
            WithDataPage(ModalRoute.of(context)?.settings.arguments as String),
        '/return-data': (context) => const ReturnDataPage(),
        '/replacement': (context) => const ReplacementPage(),
        '/another': (context) => const AnotherPage(),
        '/not-found': (context) => const NotFoundPage(),
      },
      onGenerateRoute: (settings) {
        // route /
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
            settings: settings,
          );
        }
        // route /second
        if (settings.name == '/second') {
          return MaterialPageRoute(
            builder: (context) => const SecondPage(),
            settings: settings,
          );
        }
        // route /with-data
        if (settings.name == '/with-data') {
          final String data = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => WithDataPage(data),
            settings: settings,
          );
        }
        // route /return-data
        if (settings.name == '/return-data') {
          return MaterialPageRoute(
            builder: (context) => const ReturnDataPage(),
            settings: settings,
          );
        }
        // route /replacement
        if (settings.name == '/replacement') {
          return MaterialPageRoute(
            builder: (context) => const ReplacementPage(),
            settings: settings,
          );
        }
        // route /another
        if (settings.name == '/another') {
          return MaterialPageRoute(
            builder: (context) => const AnotherPage(),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
          settings: settings,
        );
      },
    );
  }
}
