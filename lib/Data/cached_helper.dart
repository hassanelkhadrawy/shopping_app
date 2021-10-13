
import 'package:shared_preferences/shared_preferences.dart';

class SharedPre{
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
 static Future<bool?> PutData(
    {required String key, required dynamic value}) async {
   sharedPreferences=await SharedPreferences.getInstance();
   if (value is String) return await sharedPreferences!.setString(key, value);
  if (value is int) return await sharedPreferences!.setInt(key, value);
  if (value is double) return await sharedPreferences!.setDouble(key, value);

   return await sharedPreferences!.setBool(key, value).then((value){
     return value== null? false:true;
   }).catchError((onError){
     print(onError);
     return false;
   });
}

 static Future<dynamic?> getSharedData({required String key}) async {
   sharedPreferences=await SharedPreferences.getInstance();
  return sharedPreferences==null?null: sharedPreferences!.get(key);
}
  static Future<bool?> RemoveFromShared({required String key})async{
  sharedPreferences=await SharedPreferences.getInstance();
  return sharedPreferences!.remove(key);
}
}
