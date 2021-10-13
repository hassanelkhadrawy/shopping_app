import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/Data/Models/Category/category_model.dart';
import 'package:shopping_app/Data/Models/Home/home_model.dart';
import 'package:shopping_app/Data/Models/Home/shop.dart';
import 'package:shopping_app/Data/WebServices/webservices.dart';
import 'package:shopping_app/Presintation/Screens/categories.dart';
import 'package:shopping_app/Presintation/Screens/favorits.dart';
import 'package:shopping_app/Presintation/Screens/home.dart';
import 'package:shopping_app/Presintation/Screens/products.dart';
import 'package:shopping_app/Presintation/Screens/settings.dart';
import 'package:shopping_app/constants/Strings/strings.dart';

part 'shopping_screen_state.dart';

class ShoppingScreenCubit extends Cubit<ShoppingScreenState> {
  ShoppingScreenCubit() : super(ShoppingScreenInitial());

  int curentIndex=0;

   static ShoppingScreenCubit  get(context) => BlocProvider.of(context);
  List<Widget> screens_list=[
    Products(),
    Categories(),
    Favorits(),
    Settings()

  ];
  List<BottomNavigationBarItem> bottom_Nav_items=[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Categories"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: "Favorits"),
    BottomNavigationBarItem(icon:Icon (Icons.settings), label: "Settings"),
  ];
  void changeNavBottom(int index) {
    curentIndex = index;
    emit(NewsBottomNavState());
  }
  HomeModel? homeModel;
  void getHomeData(){
    emit(HomeDataLoadingState());
    WebServices().getData(url: HomeUrl).then((value){
      //shoping=Shoping.fromJson(value.data);
      homeModel=HomeModel.fromjson(value.data);
      print(homeModel!.data!.products![1].name);
      emit(HomeDataSuccessState());
    });
  }
  CategoryModel? categoryModel;
  void getCategoryData(){
    emit(HomeDataLoadingState());
    WebServices().getData(url: CategoriesUrl).then((value){
      //shoping=Shoping.fromJson(value.data);
      categoryModel=CategoryModel.fromjson(value.data);
      print(categoryModel!.data!.data![0].name);
      emit(HomeDataSuccessState());
    });
  }

}
