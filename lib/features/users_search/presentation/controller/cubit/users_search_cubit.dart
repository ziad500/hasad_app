import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/users_search/domain/models/user_data_model.dart';
import 'package:hasad_app/features/users_search/domain/use_cases/get_users_usecase.dart';
import 'package:hasad_app/features/users_search/service/qr_service.dart';

part 'users_search_state.dart';

class UsersSearchCubit extends Cubit<UsersSearchState> {
  final GetUsersUseCase _getUsersUseCase;
  UsersSearchCubit(this._getUsersUseCase) : super(UsersSearchInitial());
  static UsersSearchCubit get(context) => BlocProvider.of(context);

  TextEditingController nameContoller = TextEditingController();

  UsersModel? usersModel;
  Future<void> getUsers(String? userId) async {
    emit(GetUsersLoadingState());
    await _getUsersUseCase.execude(nameContoller.text, userId).then((value) => value.fold((l) {
          print("error is : ${l.message}");
          emit(GetUsersErrorState(l.message));
        }, (r) {
          usersModel = r;
          emit(GetUsersSuccessState());
        }));
  }

  scanQrCode() {
    QrCodeService.scanQR().then((e) {
      print(".......$e");
      if (e != "-1") {
        emit(GetQrCodeSuccessState(e));
      }
    });
  }
}
