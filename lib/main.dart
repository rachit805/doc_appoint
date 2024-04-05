import 'package:Doctor/view/auth/onboarding_screen.dart';
import 'package:Doctor/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/helpers/local_storage_helper.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  LocalStorageHelper.isLoggedIn();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(249, 249, 255, 1)),
        useMaterial3: true,
      ),
      home: LocalStorageHelper.isLoggedIn() ? HomePage() : OnBoardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
