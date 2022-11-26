import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  static Future<bool> saveTheme (String theme) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setString("theme", theme);
    return result;
  }

  static Future<String?> getTheme() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? currentTheme = sharedPreferences.getString("theme");
    return currentTheme;
  }
  // static Future<bool> addFav(String id) async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   List<String> fav = sharedPreferences.getStringList("fav") ?? [];
  //   fav.add(id);
  //   return await sharedPreferences.setStringList("fav",fav);
  //
  // }
  //
  // static Future<bool> removeFav(String id) async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   List<String> fav = sharedPreferences.getStringList("fav") ?? [];
  //   fav.remove(id);
  //   return await sharedPreferences.setStringList("fav",fav);
  //
  // }
  // static Future<L>

}