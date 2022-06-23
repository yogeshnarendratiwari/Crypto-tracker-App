import 'package:crypto_tracker/Constant/theme.dart';
import 'package:crypto_tracker/Provider/MarketProvider.dart';
import 'package:crypto_tracker/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/localStorage.dart';
import 'Screen/HomeScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String currentTheme = await LocalStorage.getTheme()?? "light";
  runApp(MyApp(theme: currentTheme));
}

class MyApp extends StatelessWidget {
  final String theme;
  const MyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [
      ChangeNotifierProvider<MarketProvider>(
        create: (context)=>MarketProvider(),
      ),
     ChangeNotifierProvider<ThemeProvider>(create:
     (context) => ThemeProvider(theme)
     )
    ], child:
      Consumer<ThemeProvider>(builder:
      (context,themeProvider,child){
       return MaterialApp(
         themeMode: themeProvider.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      }

      )
    ) ;


  }
}
