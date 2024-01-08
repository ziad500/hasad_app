import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/get_bidding_list_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

part 'bidding_list_dart_state.dart';

class BiddingListCubit extends Cubit<BiddingListState> {
  final GetBiddingListUseCase _getBiddingListUseCase;
  BiddingListCubit(this._getBiddingListUseCase) : super(BiddingListDartInitial());
  static BiddingListCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

//////////////////////////// all direct selling list //////////////////////////////
  GetMainListRequest getMainListRequest = GetMainListRequest();
  DirectSellingListModel? directSellingListModel;
  List<DirectSellingDataModel> allBidding = [];
  Future<void> getBiddingList() async {
    if (_canFetchMore()) {
      getMainListRequest.page = getPageNumber();
      getMainListRequest.departmentId = departmentMainId;
      _emitLoadingState();
      await _getBiddingListUseCase.execude(getMainListRequest, type).then((value) => value.fold(
          (l) => emit(GetBiddingListErrorState(l.message)), (r) => _handleSuccessState(r)));
    }
  }

  void _emitSuccessState() {
    emit(GetBiddingListSuccessState());
    if (directSellingListModel?.pagination?.nextPageUrl == null) {
      emit(BiddingListAllCaughtState());
    }
  }

  void _handleSuccessState(DirectSellingListModel response) {
    if (directSellingListModel == null) {
      allBidding = response.data ?? [];
      directSellingListModel = response;
    } else {
      allBidding.addAll(response.data ?? []);
      directSellingListModel = response;
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (directSellingListModel == null) {
      emit(GetBiddingListLoadingState());
    } else {
      emit(GetBiddingListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! BiddingListAllCaughtState;

  String? getPageNumber() {
    String? nextPageNumber = directSellingListModel?.pagination?.nextPageUrl
        ?.split('?')
        .firstWhere((element) => element.contains("page"));
    try {
      nextPageNumber = nextPageNumber!.split("=").last;
    } catch (_) {
      nextPageNumber = "1";
    }
    return nextPageNumber;
  }

  String? departmentMainId;
  void setDepartmentID(String? departmentId) => departmentMainId = departmentId;

  String type = biddingAboutToEnd;
  void setType(String typeName) => type = typeName;

  //////////////////////////// filter //////////////////////////////
  Future<void> passGetMainListRequest(GetMainListRequest? value) async {
    getMainListRequest = value ?? GetMainListRequest();
    directSellingListModel = null;
    emit(ResetState());
  }

  bool hasFilter() =>
      getMainListRequest.agricultureTypeId != null ||
      getMainListRequest.cityId != null ||
      getMainListRequest.districtId != null ||
      getMainListRequest.harvestDate != null ||
      getMainListRequest.highestPrice != null ||
      getMainListRequest.lowestPrice != null ||
      getMainListRequest.packagingTypeId != null ||
      getMainListRequest.regionId != null;
}

String biddingStillAvailable = "still-available";
String biddingAboutToEnd = "about-to-end";
String biddingupcoming = "upcoming";