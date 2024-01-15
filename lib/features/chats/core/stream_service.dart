import 'dart:async';

class MyStream {
  StreamSubscription<bool>? _subscription;

  void start(Function onStart) {
    // Cancel the previous subscription if it exists
    _subscription?.cancel();

    // Start a new subscription
    const interval = Duration(seconds: 3);
    _subscription = Stream.periodic(interval, (count) {
      // Perform some action here
      print('Action performed at $count');
      return false;
    }).listen((event) {
      // Do something with the event
      onStart();
      print('Received event: $event');
    });
  }

  void stop() {
    // Cancel the subscription
    _subscription?.cancel();
    _subscription = null;
  }

  void dispose() {
    // Cancel the subscription when the object is disposed
    _subscription?.cancel();
    _subscription = null;
  }
}
