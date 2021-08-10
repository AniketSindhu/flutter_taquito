@JS("taquitoBeaconWallet")
library taquito_wallet_beacon;

import 'package:js/js.dart';

@JS("BeaconWallet")
class BeaconWallet {
  external BeaconWallet(BeaconWalletOptions options);

  @JS("requestPermissions")
  external Future requestPermissions(Permissions requestPermissionInput);
  @JS("getPKH")
  external Future<String> getPKH();
}

@JS()
@anonymous
class BeaconWalletOptions {
  external String get name;
  external String get iconUrl;
  external String get preferredNetwork;
  // Must have an unnamed factory constructor with named arguments.
  external factory BeaconWalletOptions(
      {String name, String iconUrl, String preferredNetwork});
}

@JS()
@anonymous
class Permissions {
  external Network get network;
  external List<String> get scopes;

  // Must have an unnamed factory constructor with named arguments.
  external factory Permissions({Network network, List<String> scopes});
}

@JS()
@anonymous
class Network {
  external String get type;

  // Must have an unnamed factory constructor with named arguments.
  external factory Network({String type});
}
