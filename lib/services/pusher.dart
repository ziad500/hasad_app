import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

String bidChannel = "bid_channel";

class PusherService {
  static PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  static init({dynamic Function(PusherEvent)? onEvent}) async {
    await pusher.init(
      apiKey: "b7474dd013a791493467",
      cluster: "eu",
      onEvent: onEvent ?? (event) {},
    );
  }

  static connect() async {
    await pusher.connect();
  }

  static disconnect() async {
    await pusher.disconnect();
  }

  static subscribe({required String channelName}) async {
    await pusher.subscribe(channelName: channelName);
  }

  static unsubscribe({required String channelName}) async {
    await pusher.unsubscribe(channelName: channelName);
  }
}
