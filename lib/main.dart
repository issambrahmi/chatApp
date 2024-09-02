import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/Services/hive_services.dart';
import 'package:chat_app/View/Pages/home_page.dart';
import 'package:chat_app/View/Pages/login_page.dart';
import 'package:chat_app/View/Pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

bool? isLogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  void initState()  {
   HiveServices.LoginBox();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: MyColors.mainColor,
          ),
          home: child,
        );
      },
      child: isLogin == true ? const HomePage() : const LoginPage(),
    );
  }
}
