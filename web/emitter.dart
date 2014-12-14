import "dart:isolate";
import "dart:async";

main(List<String> args, SendPort port) {
  print("isolate: start");
  port.send("emitter: started ...");
  var count = 0;
  callback(_) {
    count++;
    port.send("counter=$count");
  }
  new Timer.periodic(new Duration(seconds:1), callback);
}