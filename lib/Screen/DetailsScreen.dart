import 'package:crypto_tracker/Model/Cryptocurrency.dart';
import 'package:crypto_tracker/Provider/MarketProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(child:
      Container(
        child: Consumer<MarketProvider> (
          builder: (context,marketProvider,child){
            CryptoCurrency currentCrypto = marketProvider.fetchCryptoById(widget.id);
          return ListView(
            physics : BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
            ),
            children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(),
                  ),

                )
            ],
    );
          },
    )
      )
      ),
    );
  }
}
