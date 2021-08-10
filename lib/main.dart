import 'package:flutter/material.dart';
import 'package:flutter_taquito/model/beacon.dart';
import 'package:flutter_taquito/model/tezos.dart';
import 'package:js/js_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TezosToolkit? tezos;
  BeaconWallet? beaconWallet;
  String? key = "Connect Wallet First";
  @override
  void initState() {
    super.initState();
    tezos = new TezosToolkit("https://florencenet.smartpy.io");
    beaconWallet = BeaconWallet(BeaconWalletOptions(
      name: "Example Dapp",
      preferredNetwork: "florencenet",
      iconUrl: 'https://tezostaquito.io/img/favicon.png',
    ));
  }

  void connect() async {
    await beaconWallet!
        .requestPermissions(Permissions(network: Network(type: "florencenet")));
    if (beaconWallet != null) {
      tezos!.setWalletProvider(beaconWallet!);
      key = await promiseToFuture(beaconWallet!.getPKH());
      setState(() {});
    } else {
      print("Wallet not connected Error.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Public Key',
            ),
            Text(
              '$key',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: connect, child: Text('Connect Wallet'))
          ],
        ),
      ),
    );
  }
}
