import 'package:flutter/material.dart';
import 'package:shopping_app/Data/cached_helper.dart';
import 'package:shopping_app/Logic/Cubit/ShoppingScreen/shopping_screen_cubit.dart';
import 'package:shopping_app/Presintation/Screens/login_screen.dart';
import 'package:shopping_app/constants/Componant/componants.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: RaisedButton(
        onPressed: (){
          SharedPre.RemoveFromShared(key: "token").then((value){
            NavigateToFinish(context: context, widget: LoginScreen());

          });

        },
        child: Text("LogOut"),
      ),
    );
  }
}
