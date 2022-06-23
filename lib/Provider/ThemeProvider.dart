import 'package:crypto_tracker/Model/localStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
   late ThemeMode themeMode;
   ThemeProvider(String theme){
     if(theme == "light"){
       themeMode = ThemeMode.light;
     }
     else{
       themeMode = ThemeMode.dark;
     }

   }

  void toggleTheme() async{
    if(themeMode == ThemeMode.light){
      themeMode = ThemeMode.dark;
      LocalStorage.saveTheme("dark");
    }
    else{
      themeMode = ThemeMode.light;
      LocalStorage.saveTheme("light");
    }
   notifyListeners();
  }
}