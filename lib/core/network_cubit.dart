import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Enum to represent different states of internet connectivity.
enum InternetState { initial, lost, gained }

// A Cubit (a state management class) to manage internet connectivity.
class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();

  static InternetCubit get(context) => BlocProvider.of(context);

  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  // Subscription to monitor changes in internet connectivity.
  StreamSubscription? _connectivitySubscription;
  bool isLost = false;

  // Constructor for the InternetCubit class.
  InternetCubit() : super(InternetState.initial) {
    // Start listening to changes in connectivity when an instance is created.
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        // If mobile or Wi-Fi connectivity is detected, emit 'gained' state.
        if (isLost) {
          emit(InternetState.gained);
          isLost = false;
        }
      } else {
        // If no mobile or Wi-Fi connectivity is detected, emit 'lost' state.
        isLost = true;
        emit(InternetState.lost);
      }
    });
  }

  @override
  Future<void> close() {
    // Cancel the connectivity subscription when this Cubit is closed.
    _connectivitySubscription?.cancel();
    return super.close();
  }

  void internetListner(context, InternetState state) {
    {
      if (state == InternetState.gained) {
        /*    showSnackbar(
            context: context, text: AppStrings.internetRestored.tr(), state: ToastStates.SUCCESS);
      */
      } else if (state == InternetState.lost) {
        /*    showSnackbar(
            context: context, text: AppStrings.noInternetError.tr(), state: ToastStates.ERROR);
      */
      }
    }
  }
}
