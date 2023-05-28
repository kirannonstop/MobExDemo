import 'package:device_preview/device_preview.dart';
import 'package:first_mobex_flutter_project/pages/home.dart';
import 'package:flutter/material.dart';

main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
/*
class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        )),
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print('Home build');
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}*/
