import 'dart:developer';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

String bidChannel = "auction-channel";

class PusherService {
  static PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  static init({dynamic Function(PusherEvent)? onEvent}) async {
    await pusher.init(
      apiKey: "ba0c08cc56fa89a9be5a",
      logToConsole: true,
      enableStats: true,
      cluster: "eu",
      onEvent: onEvent ?? (event) {},
      onSubscriptionError: (message, error) => log("pusher onSubscriptionError $error"),
      onSubscriptionSucceeded: (channelName, data) => log("pusher $channelName"),
      onError: (message, code, error) => log("pusher error $error"),
      onConnectionStateChange: (currentState, previousState) =>
          log("pusher onConnectionStateChange $currentState"),
      onAuthorizer: (channelName, socketId, options) =>
          log("pusher onAuthorizer $channelName  $options"),
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
