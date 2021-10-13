import 'package:shopping_app/Data/cached_helper.dart';

const String BaseUrl='https://student.valuxapps.com/api/';
const String LoginUrl='login';
const String HomeUrl='home';
const String CategoriesUrl='categories';

 Future UserToken =  SharedPre.getSharedData(key: "token");
