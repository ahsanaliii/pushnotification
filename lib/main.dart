import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pushnotification/api/firebase_api.dart';
import 'package:pushnotification/firebase_options.dart';
import 'package:pushnotification/page/home_screen.dart';
import 'package:pushnotification/page/notification_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifiactions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
      navigatorKey: navigatorKey,
      routes: {
        // "/home_screen": (context) => HomeScreen(),
        "/notification_screen": (context) => NotificationScreen(),
      },
    );
  }
}
