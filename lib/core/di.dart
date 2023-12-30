import 'package:hasad_app/features/auth/presentation/controller/signup/user/sign_up_cubit.dart';

import 'dio_factory.dart';
import '../features/auth/data/data_source.dart/auth_remote_data_source.dart';
import '../features/auth/data/network/auth_app_api.dart';
import '../features/auth/data/repository/auth_repo_impl.dart';
import '../features/auth/domain/Repository/auth_repo.dart';
import '../features/auth/domain/usecase/request_change_password_usecase.dart';
import '../features/auth/domain/usecase/reset_password_usecase.dart';
import '../features/auth/domain/usecase/user_login_usecase.dart';
import '../features/auth/domain/usecase/user_signup_usecase.dart';
import '../features/auth/domain/usecase/verify_otp_usecase.dart';
import '../features/auth/presentation/controller/forget_password_cubit/forget_password_cubit.dart';
import '../features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
Future<void> initAppModule() async {
  sl.registerLazySingleton<DioFactory>(() => DioFactory());
  iniLogin();
  iniForgetPassword();
}

iniLogin() async {
  //cubit
  if (!GetIt.I.isRegistered<LoginCubit>()) {
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl.call()));
  }
  if (!GetIt.I.isRegistered<UserSignUpCubit>()) {
    sl.registerFactory<UserSignUpCubit>(() => UserSignUpCubit(sl.call()));
  }
  //app service client instance
  if (!GetIt.I.isRegistered<AuthAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<AuthAppServiceClient>(() => AuthAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<AuthRepository>()) {
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<AuthRemoteDataSource>()) {
    sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<UserLoginUseCase>()) {
    sl.registerLazySingleton<UserLoginUseCase>(() => UserLoginUseCase(sl.call()));
  }

  if (!GetIt.I.isRegistered<UserSignUpUseCase>()) {
    sl.registerLazySingleton<UserSignUpUseCase>(() => UserSignUpUseCase(sl.call()));
  }
}

iniForgetPassword() async {
  //cubit
  if (!GetIt.I.isRegistered<ForgetPasswordCubit>()) {
    sl.registerFactory<ForgetPasswordCubit>(
        () => ForgetPasswordCubit(sl.call(), sl.call(), sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    sl.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    sl.registerLazySingleton<VerifyOtpUseCase>(() => VerifyOtpUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<RequestChangePasswordUseCase>()) {
    sl.registerLazySingleton<RequestChangePasswordUseCase>(
        () => RequestChangePasswordUseCase(sl.call()));
  }
}
