import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Logic/Cubit/ShoppingScreen/shopping_screen_cubit.dart';
class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingScreenCubit,ShoppingScreenState>(
      listener: (context,stte){},
      builder: (context,stte){
        var cubit=ShoppingScreenCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottom_Nav_items,
            currentIndex:cubit.curentIndex,
            onTap: (index){
              cubit.changeNavBottom(index);
            },
          ),
          body:cubit.screens_list[cubit.curentIndex],
        );
      },
    );
  }
}
