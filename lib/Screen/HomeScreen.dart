import 'package:crypto_tracker/Model/Cryptocurrency.dart';
import 'package:crypto_tracker/Provider/MarketProvider.dart';
import 'package:crypto_tracker/Provider/ThemeProvider.dart';
import 'package:crypto_tracker/Screen/DetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("Crypto Today", style: TextStyle(fontSize: 40)),
                IconButton(onPressed: (){
                  themeProvider.toggleTheme();

                }, icon:themeProvider.themeMode == ThemeMode.light ? Icon(Icons.adjust_sharp) : Icon(Icons.add),
                ) ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: Consumer<MarketProvider>(
              builder: (context, marketProvider, child) {
                if (marketProvider.isLoading == true) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (marketProvider.markets.length > 0) {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: marketProvider.markets.length,
                        itemBuilder: (context, index) {
                          CryptoCurrency currentCrypto =
                              marketProvider.markets[index];
                          return ListTile(
                            onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(id : currentCrypto.id!)));
                              
                            }
                            ,
                            contentPadding: EdgeInsets.all(0),
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage:
                                  NetworkImage(currentCrypto.image!),
                            ),
                            title: Text(currentCrypto.name! + " #${currentCrypto.marketCapRank}"),
                            subtitle: Text(currentCrypto.symbol!.toUpperCase()),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("₹ " +
                                    currentCrypto.currentPrice!
                                        .toStringAsFixed(4)),
                                Builder(
                                  builder: (context) {
                                    double priceChange =
                                        currentCrypto.price_change_24h!;
                                    double priceChangePercentage = currentCrypto
                                        .price_percentage_change_24h!;

                                    if (priceChange < 0) {
                                      return Text(
                                        "${priceChangePercentage.toStringAsFixed(2)} % (${priceChange.toStringAsFixed(4)})",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        "+ ${priceChangePercentage.toStringAsFixed(2)} % (+ ${priceChange.toStringAsFixed(4)})",
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return Text("Data not found");
                  }
                }
              },
            ))
          ],
        ),
      )),
    );
  }
}
