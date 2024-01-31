import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/db/db_helper.dart';
import 'package:local_database/pages/bindings.dart';
import 'package:local_database/pages/create/bindings.dart';
import 'package:local_database/pages/create/create.dart';
import 'package:local_database/pages/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: "/",
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(name: "/", page: () => const HomePage(), binding: HomeBindings()),
        GetPage(name: "/create", page: () => const CreatePage(), binding: CreateBindings())
      ],
    );
  }
}


