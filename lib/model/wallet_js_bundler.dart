import 'package:js/js.dart';

typedef Func0<R> = Future<R> Function();

// ignore: missing_js_lib_annotation
@JS('beacon.DAppClient')
class DappClient {
  // ignore: missing_js_lib_annotation
  external factory DappClient(Options walletDetails);
  // ignore: missing_js_lib_annotation
  @JS('init')
  external Func0<String> init();
  // ignore: missing_js_lib_annotation
  @JS('connect')
  external Func0<String> connect();
  // ignore: missing_js_lib_annotation
  @JS('requestPermissions')
  external Func0<String> requestPermissions();
}

// ignore: missing_js_lib_annotation
@JS()
@anonymous
class Options {
  external bool get name;

  // Must have an unnamed factory constructor with named arguments.
  external factory Options({String name});
}
