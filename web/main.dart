
import "dart:html";
import "dart:isolate";

main() {
  var e = querySelector("#message");
  e.text = "Hello World!";

  ReceivePort port = new ReceivePort();
  Isolate.spawnUri(Uri.parse("emitter.dart"), [], port.sendPort).then((isolate) {
      print('isolate spawned');
  });
  port.listen((msg){
    print("got a message: $msg");
    e.text = msg;
  });
}