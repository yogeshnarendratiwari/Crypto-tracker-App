import 'package:crypto_tracker/Model/Cryptocurrency.dart';
import 'package:crypto_tracker/Provider/MarketProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:crypto_tracker/Provider/ThemeProvider.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    Widget divider(){
      return Divider(
        color: themeProvider.themeMode == ThemeMode.light ? Colors.black87 : Colors.white70,
        thickness: 2,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Coin Info",style: TextStyle(fontWeight: FontWeight.bold,color: themeProvider.themeMode == ThemeMode.light ? Colors.black87 : Colors.white70),),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed:(){}, icon: Icon(Icons.account_circle,color:themeProvider.themeMode == ThemeMode.light ? Colors.black45 : Colors.white70 ,)),
          IconButton(onPressed: (){
            themeProvider.toggleTheme();

          }, icon:themeProvider.themeMode == ThemeMode.light ? Icon(FontAwesomeIcons.sun,color: Colors.black45,size: 22,) : Icon(FontAwesomeIcons.moon,color: Colors.white70,),
          )
        ],
      ),
      body: SafeArea(child: Container(child: Consumer<MarketProvider>(
        builder: (context, marketProvider, child) {
          CryptoCurrency currentCrypto =
              marketProvider.fetchCryptoById(widget.id);
          return RefreshIndicator(
              onRefresh: () async {
                await marketProvider.fetchData();
              },
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics:
                  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    divider(),
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(currentCrypto.image!),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      currentCrypto.name!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),

                    SizedBox(
                      height: 50,
                    ),
 divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Appearance :",style: TextStyle(fontWeight: FontWeight.bold)),
                          CircleAvatar(
                            radius: 11,
                            backgroundImage: NetworkImage(currentCrypto.image!),
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rank :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(currentCrypto.marketCapRank.toString(),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Name :",style: TextStyle(fontWeight: FontWeight.bold)), Text(currentCrypto.name!,style: TextStyle(fontWeight: FontWeight.bold))],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Symbol :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(currentCrypto.symbol!.toUpperCase().toString(),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Currrent price :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "₹ " + currentCrypto.currentPrice!.toStringAsFixed(4),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Market cap :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("₹ " +currentCrypto.marketCap!.toStringAsFixed(4),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("High 24h :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("₹ " +currentCrypto.high_24h!.toStringAsFixed(4),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Low 24h :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("₹ " +currentCrypto.low_24h!.toStringAsFixed(4),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Circulating supply :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(currentCrypto.circulatingSupply!.toString(),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All time high :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(currentCrypto.ath!.toStringAsFixed(4),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All time low :",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(currentCrypto.atl!.toStringAsFixed(4),style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Builder(
                      builder: (context) {
                        double priceChange = currentCrypto.price_change_24h!;
                        double priceChangePercentage =
                            currentCrypto.price_percentage_change_24h!;
                        if (priceChange < 0) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Price change 24h :",style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                "${priceChangePercentage.toStringAsFixed(2)} % (${priceChange.toStringAsFixed(4)})",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Price change 24h :",style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                "+ ${priceChangePercentage.toStringAsFixed(2)} % (+ ${priceChange.toStringAsFixed(4)})",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
divider(),
                  ],
                ),
              ],
            ),
          );
        },
      ))),
    );
  }
}
