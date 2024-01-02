import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/requests/presentation/components/choose_type_request.dart';

part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  AddRequestCubit() : super(AddRequestInitial());
  static AddRequestCubit get(context) => BlocProvider.of(context);

  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  int pageNumber = 0;
  void changepageViewIndex(int index) {
    pageNumber = index;
    emit(ChangePAgeViewIndexState());
  }

  List<Widget> screens = [const ChooseTypeOfRequest()];

  PageController pageController = PageController();
}
