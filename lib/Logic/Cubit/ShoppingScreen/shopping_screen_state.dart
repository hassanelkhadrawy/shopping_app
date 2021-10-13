part of 'shopping_screen_cubit.dart';

@immutable
abstract class ShoppingScreenState {}

class ShoppingScreenInitial extends ShoppingScreenState {}
class NewsBottomNavState extends ShoppingScreenState {}
class HomeDataLoadingState extends ShoppingScreenState {}
class HomeDataSuccessState extends ShoppingScreenState {}

class CategoryDataLoadingState extends ShoppingScreenState {}
class CategoryDataSuccessState extends ShoppingScreenState {}