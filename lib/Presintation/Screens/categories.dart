import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Data/Models/Category/category_model.dart';
import 'package:shopping_app/Logic/Cubit/ShoppingScreen/shopping_screen_cubit.dart';
import 'package:shopping_app/constants/Componant/componants.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingScreenCubit,ShoppingScreenState>(
        listener:(context,state){},
      builder: (context,state){
        var categorymodel=ShoppingScreenCubit.get(context).categoryModel;
        return ListView.separated(
          itemBuilder: (context,index)=>BuildCategoryItem(categorymodel!.data!.data![index]),
              separatorBuilder:  (context,index)=>MyDevider(),
              itemCount: categorymodel!.data!.data!.length);
      });
  }
  Widget BuildCategoryItem(CategoryItem categoryItem){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: double.infinity,
        child: (
        Row(
          children: [
            Image(
                image: NetworkImage(categoryItem.image),fit: BoxFit.cover,),
            Text("${categoryItem.name}",style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined),
          ],
        )
        ),
      ),
    );
  }
}
