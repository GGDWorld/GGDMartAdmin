

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggd_mart_admin/const/firebase_const.dart';
import 'package:ggd_mart_admin/const/strings.dart';
import 'package:ggd_mart_admin/controller/orders_controller.dart';
import 'package:ggd_mart_admin/views/auth_screen/login_screen.dart';
import 'package:ggd_mart_admin/views/home-screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyBexo0Ge9l_8y958uSPMVF-gnDeHGpsEmY", 
    //   appId: "1:528228304793:android:c4be295b92c48bf10fb508", 
    //   messagingSenderId: "528228304793", 
    //   projectId: "ggd_mart",
    //   storageBucket: "ggd-mart.appspot.com",
    //   )
  );

  // Register the OrdersController once in the app's root
  Get.put(OrdersController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final dynamic data;
  const MyApp({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      home: const MyAppRoot(),
    );
  }
}

class MyAppRoot extends StatefulWidget {
  const MyAppRoot({super.key});

  @override
  State<MyAppRoot> createState() => _MyAppRootState();
}

class _MyAppRootState extends State<MyAppRoot> {
  @override
  void initState() {
    final ordersController = Get.find<OrdersController>();
    ordersController.fetchOrderCount();
    checkUser();
    super.initState();
  }

  var isLogedin = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        isLogedin = false;
      } else {
        isLogedin = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogedin ? const Home() : const LoginScreen();
        // return const Home();

  }
}
