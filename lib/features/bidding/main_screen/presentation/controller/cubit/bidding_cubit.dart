import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bidding_state.dart';

class BiddingCubit extends Cubit<BiddingState> {
  BiddingCubit() : super(BiddingInitial());
}
