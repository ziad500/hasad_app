import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding_requests/domain/models/model.dart';
import 'package:hasad_app/features/bidding_requests/domain/use_cases/accept_or_reject_usecase.dart';
import 'package:hasad_app/features/bidding_requests/domain/use_cases/get_bidding_requests_usecse.dart';
part 'bidding_requests_state.dart';

class BiddingRequestsCubit extends Cubit<BiddingRequestsState> {
  final GetBiddingRequestsUsecse _getBiddingRequestsUsecse;
  final AcceptOrRejectBiddingRequestsUsecase _acceptOrRejectBiddingRequestsUsecase;
  BiddingRequestsCubit(this._getBiddingRequestsUsecse, this._acceptOrRejectBiddingRequestsUsecase)
      : super(BiddingRequestsInitial());
  static BiddingRequestsCubit get(context) => BlocProvider.of(context);

  String? page;
  BiddingRequestsModel? biddingRequestsModel;
  List<BiddingRequestsDataModel> allBiddingRequests = [];
  String? advertismentId1;
  Future<void> getBiddingRequestsList(String? advertismentId) async {
    advertismentId1 = advertismentId;
    if (_canFetchMore() || biddingRequestsModel == null) {
      page = getPageNumber();

      _emitLoadingState();
      await _getBiddingRequestsUsecse.execude(page!, advertismentId).then((value) => value.fold(
          (l) => emit(GetBiddingRequestsListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetBiddingRequestsListSuccessState());
    if (biddingRequestsModel?.pagination?.nextPageUrl == null) {
      emit(BiddingRequestsListAllCaughtState());
    }
  }

  void _handleSuccessState(BiddingRequestsModel response) {
    if (biddingRequestsModel == null) {
      allBiddingRequests = response.data ?? [];
      biddingRequestsModel = response;
    } else {
      allBiddingRequests.addAll(response.data ?? []);
      biddingRequestsModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (biddingRequestsModel == null) {
      emit(GetBiddingRequestsListLoadingState());
    } else {
      emit(GetBiddingRequestsListPaginationLoadingState());
    }
  }

  bool _canFetchMore() =>
      biddingRequestsModel != null && biddingRequestsModel?.pagination?.nextPageUrl != null;

  String? getPageNumber() {
    String? nextPageNumber = biddingRequestsModel?.pagination?.nextPageUrl
        ?.split('?')
        .firstWhere((element) => element.contains("page"));
    try {
      nextPageNumber = nextPageNumber!.split("=").last;
    } catch (_) {
      nextPageNumber = "1";
    }
    return nextPageNumber;
  }

  Future<void> acceptOrReject({required bool isAccept, required String id}) async {
    emit(GetAcceptOrRejectLoadingState());
    await _acceptOrRejectBiddingRequestsUsecase
        .execude(isAccept ? "accept-winning-auction/$id" : "reject-winning-auction/$id")
        .then((value) => value.fold((l) => emit(GetAcceptOrRejectErrorState(l.message)), (r) {
              biddingRequestsModel = null;
              getBiddingRequestsList(advertismentId1);
            }));
  }
}
