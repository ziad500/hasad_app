import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/requests.dart';
import '../../../domain/models/lists_model.dart';
import '../../../domain/use_cases/get_cities_list_usecase.dart';
import '../../../domain/use_cases/get_districts_list_usecase.dart';
import '../../../domain/use_cases/get_list_by_endpoint_usecase.dart';

part 'lists_state.dart';

class ListsCubit extends Cubit<ListsState> {
  final GetCitiesListUseCase getCitiesListUseCase;
  final GetDistrictsListUseCase getDistrictsListUseCase;
  final GetListByEndPointUseCase getListByEndPointUseCase;

  ListsCubit(this.getCitiesListUseCase, this.getDistrictsListUseCase, this.getListByEndPointUseCase)
      : super(ListsInitial());
  static ListsCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  ListsModel? citiesModel;

  Future<void> getCitisList(RegionsListRequest regionsListRequest) async {
    citiesModel = null;
    emit(GetCitiesLoadingState());
    await getCitiesListUseCase.execude(regionsListRequest).then((value) => value.fold((l) {
          emit(GetCitiesErrorState(l.message));
        }, (r) {
          citiesModel = r;
          emit(GetCitiesSuccessState());
        }));
  }

  ListsModel? districtsModel;

  Future<void> getDitrictsList(RegionsListRequest regionsListRequest) async {
    districtsModel = null;
    emit(GetDistrictsLoadingState());
    await getDistrictsListUseCase.execude(regionsListRequest).then((value) => value.fold((l) {
          emit(GetDistrictsErrorState(l.message));
        }, (r) {
          districtsModel = r;
          emit(GetDistrictsSuccessState());
        }));
  }

  ListsModel? regionsModel;

  Future<void> getRegionsList() async {
    regionsModel = null;
    emit(GetRegionsLoadingState());
    await getListByEndPointUseCase
        .execude(AllListsRequest("regions"))
        .then((value) => value.fold((l) {
              emit(GetRegionsErrorState(l.message));
            }, (r) {
              citiesModel = null;
              districtsModel = null;
              regionsModel = r;
              emit(GetRegionsSuccessState());
            }));
  }

  ListsModel? departmentsModel;

  Future<void> getDepartmentsList() async {
    departmentsModel = null;
    emit(GetDepartmentsLoadingState());
    await getListByEndPointUseCase
        .execude(AllListsRequest("departments"))
        .then((value) => value.fold((l) {
              emit(GetDepartmentsErrorState(l.message));
            }, (r) {
              departmentsModel = r;
              emit(GetDepartmentsSuccessState());
            }));
  }

  ListsModel? placeTypes;

  Future<void> getPlaceTypesList() async {
    placeTypes = null;
    emit(GetPlaceTypesLoadingState());
    await getListByEndPointUseCase
        .execude(AllListsRequest("inspection/places"))
        .then((value) => value.fold((l) {
              emit(GetPlaceTypesErrorState(l.message));
            }, (r) {
              placeTypes = r;
              emit(GetPlaceTypesSuccessState());
            }));
  }

  ListsModel? inspectionTypesModel;

  Future<void> getinspectionTypesList() async {
    inspectionTypesModel = null;
    emit(GetIncpectionTypesLoadingState());
    await getListByEndPointUseCase
        .execude(AllListsRequest("inspection/types"))
        .then((value) => value.fold((l) {
              emit(GetIncpectionTypesErrorState(l.message));
            }, (r) {
              inspectionTypesModel = r;
              emit(GetIncpectionTypesSuccessState());
            }));
  }

  ListsModel? inspectionIncludesModel;

  Future<void> getinspectionIncludesList() async {
    inspectionTypesModel = null;
    emit(GetIncpectionIncludesLoadingState());
    await getListByEndPointUseCase
        .execude(AllListsRequest("inspection/includes"))
        .then((value) => value.fold((l) {
              emit(GetIncpectionIncludesErrorState(l.message));
            }, (r) {
              inspectionIncludesModel = r;
              emit(GetIncpectionIncludesSuccessState());
            }));
  }
}
