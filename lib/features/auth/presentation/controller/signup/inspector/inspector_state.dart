part of 'inspector_cubit.dart';

class InspectorSignUpState {
  const InspectorSignUpState();
}

final class InspectorInitial extends InspectorSignUpState {}

class ViewPasswordState extends InspectorSignUpState {}

class ConfirmViewPasswordState extends InspectorSignUpState {}

class OldViewPasswordState extends InspectorSignUpState {}

class ChangePAgeViewIndexState extends InspectorSignUpState {}

class InspectorSignUpLoadingState extends InspectorSignUpState {}

class InspectorSignUpSuccessState extends InspectorSignUpState {}

class InspectorSignUpErrorState extends InspectorSignUpState {
  final String error;
  const InspectorSignUpErrorState(this.error);
}

class AddToDepartmentsListState extends InspectorSignUpState {}

class RemoveFromDepartmentsListState extends InspectorSignUpState {}

class AddToTypeOfDepartmentsListState extends InspectorSignUpState {}

class RemoveFromTypeOfDepartmentsListState extends InspectorSignUpState {}

class AddToRegionsListState extends InspectorSignUpState {}

class RemoveFromRegionsListState extends InspectorSignUpState {}

class AddToCityListState extends InspectorSignUpState {}

class RemoveFromCityListState extends InspectorSignUpState {}

class AddToDistrictListState extends InspectorSignUpState {}

class RemoveFromDistrictListState extends InspectorSignUpState {}

class AddToInspectionTypesListState extends InspectorSignUpState {}

class RemoveFromInspectionTypesListState extends InspectorSignUpState {}
