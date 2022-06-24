import 'package:crypto_tracker/Model/Cryptocurrency.dart';
import 'package:crypto_tracker/Provider/MarketProvider.dart';
import 'package:crypto_tracker/Provider/ThemeProvider.dart';
import 'package:crypto_tracker/Screen/DetailsScreen.dart';
import 'package:crypto_tracker/Screen/Favorite.dart';
import 'package:crypto_tracker/Screen/Market.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Coin Trace",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: themeProvider.themeMode == ThemeMode.light
                  ? Colors.black87
                  : Colors.white70),
        ),
        backgroundColor: themeProvider.themeMode == ThemeMode.light
            ? Colors.blueGrey
            : Colors.black38,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: themeProvider.themeMode == ThemeMode.light
                    ? Colors.black45
                    : Colors.white70,
              )),
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: themeProvider.themeMode == ThemeMode.light
                ? Icon(
                    FontAwesomeIcons.sun,
                    color: Colors.black45,
                    size: 22,
                  )
                : Icon(
                    FontAwesomeIcons.moon,
                    color: Colors.white70,
                  ),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
          top: 0,
          left: 20,
          right: 20,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(

                controller: _tabController,
                indicatorColor: Colors.blueGrey,
                tabs:  [

              Tab(
               child: Text("Trace",style: TextStyle(color: themeProvider.themeMode == ThemeMode.light
                   ? Colors.black
                   : Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
              ),
              Tab(
                child: Text("Favourite",style: TextStyle(color: themeProvider.themeMode == ThemeMode.light
                    ? Colors.black
                    : Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
              ),


            ]),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
                ),
                controller: _tabController,
                  children: [
                    Market(),
                    Favorite(),

                  ]
              ),
            )
          ],
        ),
      )),
    );
  }
}
