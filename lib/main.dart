import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Data/cached_helper.dart';
import 'package:shopping_app/Data/WebServices/webservices.dart';
import 'package:shopping_app/Logic/Cubit/Login/login_cubit.dart';
import 'package:shopping_app/Logic/Cubit/ShoppingScreen/shopping_screen_cubit.dart';
import 'package:shopping_app/Presintation/Screens/home.dart';
import 'package:shopping_app/Presintation/Screens/login_screen.dart';
import 'package:shopping_app/Presintation/Screens/shopping_screen.dart';
import 'package:shopping_app/Thimes/thime.dart';

import 'Presintation/Screens/on_boarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WebServices.init();
  await SharedPre.init();

  bool? isBoarding = await SharedPre.getSharedData(key: "onBoarding");
  String? token = await SharedPre.getSharedData(key: "token");

  isBoarding ??= false;
  Widget Layout() {
    if (token == null) {
      if (isBoarding == null || isBoarding == false) {
        return OnBoarding();
      } else {
        return LoginScreen();
      }
    } else {
      return ShoppingScreen();
    }
  }

  runApp(MyApp(
    layout: Layout(),
  ));
}

class MyApp extends StatelessWidget {
  Widget layout;

  MyApp({Key? key, required this.layout}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => ShoppingScreenCubit()..getHomeData()..getCategoryData()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            home: layout));
  }
}
