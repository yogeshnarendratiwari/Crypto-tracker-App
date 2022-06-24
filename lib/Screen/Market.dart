import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Cryptocurrency.dart';
import '../Provider/MarketProvider.dart';
import '../Provider/ThemeProvider.dart';
import 'DetailsScreen.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Expanded(child: Consumer<MarketProvider>(
      builder: (context, marketProvider, child) {
        if (marketProvider.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (marketProvider.markets.length > 0) {
            return RefreshIndicator(
              onRefresh: () async {
                await marketProvider.fetchData();
              },
              child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: marketProvider.markets.length,
                  itemBuilder: (context, index) {
                    CryptoCurrency currentCrypto =
                        marketProvider.markets[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(id: currentCrypto.id!)));
                      },
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(
                        backgroundColor:
                            themeProvider.themeMode == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                        backgroundImage: NetworkImage(currentCrypto.image!),
                      ),
                      title: Text(
                        currentCrypto.name!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(currentCrypto.symbol!.toUpperCase()),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹ " +
                                currentCrypto.currentPrice!.toStringAsFixed(4),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Builder(
                            builder: (context) {
                              double priceChange =
                                  currentCrypto.price_change_24h!;
                              double priceChangePercentage =
                                  currentCrypto.price_percentage_change_24h!;

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
                  }),
            );
          } else {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Center(
                    child: Text(
                  "Data not found",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )));
          }
        }
      },
    ));
  }
}
