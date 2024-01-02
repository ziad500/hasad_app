import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bidding_state.dart';

class BiddingCubit extends Cubit<BiddingState> {
  BiddingCubit() : super(BiddingInitial());
}
