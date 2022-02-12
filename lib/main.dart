import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test/screens/form_user.dart';
import 'package:test/screens/list_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
        title: 'Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: ListData.namePage,
        getPages: [
          GetPage(
            name: ListData.namePage,
            page: () => const ListData(),
          ),
          GetPage(
            name: FormUser.namePage,
            page: () => const FormUser(),
          ),
        ]);
  }
}
