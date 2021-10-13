import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Data/cached_helper.dart';
import 'package:shopping_app/Logic/Cubit/Login/login_cubit.dart';
import 'package:shopping_app/Presintation/Screens/home.dart';
import 'package:shopping_app/constants/Componant/componants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {

          if (state is LoginSuccess){
            if(state.loginModel.status){
              SharedPre.PutData(key: "token", value: state.loginModel.data!.token).then((value){
                NavigateToFinish(context: context, widget: Home());
                defaultSnakBar(context: context, message: state.loginModel.message, color: Colors.green);
              });
            }else{
              defaultSnakBar(context: context, message: state.loginModel.message, color: Colors.redAccent);

            }
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Login now to brouse our offers",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultTextForm(
                        controller: emailControler,
                        type: TextInputType.emailAddress,
                        lable: "Email Address",
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "please enter your email";
                          }
                        },
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultTextForm(
                          controller: passwordControler,
                          type: TextInputType.emailAddress,
                          lable: "Password",
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "password is too short";
                            }
                          },
                          prefixIcon: Icon(Icons.password_outlined),
                          isPassword:LoginCubit.get(context).isPassword ,
                          suffixIcon:LoginCubit.get(context).suffixIcon ,
                        iconPressed: (){
                            LoginCubit.get(context).ShowingPassword();
                        }
                      ),

                      SizedBox(
                        height: 15.0,
                      ),
                      ConditionalBuilder(
                          condition: state is! LoginLoading,
                          builder: (context)=> defaultButton(
                              lable: "Login",
                              color: Colors.blue,
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  LoginCubit.get(context).GetLoginData(
                                      email: emailControler.text,
                                      password: passwordControler.text);
                                }


                              }),
                        fallback: (context)=> Center(child: CircularProgressIndicator()),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have account ?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.grey)),
                          TextButton(onPressed: () {}, child: Text("Register"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

