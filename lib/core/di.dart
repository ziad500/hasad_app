import 'package:hasad_app/features/auth/presentation/controller/signup/user/sign_up_cubit.dart';
import 'package:hasad_app/features/categories/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/categories/data/network/categories_api.dart';
import 'package:hasad_app/features/categories/data/repository/repo_impl.dart';
import 'package:hasad_app/features/categories/domain/repository/repo.dart';
import 'package:hasad_app/features/categories/domain/use_cases/get_categories_types_usecase.dart';
import 'package:hasad_app/features/categories/domain/use_cases/get_categories_usecase.dart';
import 'package:hasad_app/features/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/direct_selling_list_api.dart';
import 'package:hasad_app/features/direct_selling/all/data/repository/repo_impl.dart';
import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_direct_selling_list_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/cubit/direct_selling_list_dart_cubit.dart';
import 'package:hasad_app/features/lists/data/data_source/lists_data_source.dart';
import 'package:hasad_app/features/lists/data/network/lists_api.dart';
import 'package:hasad_app/features/lists/data/repository/lists_repo_impl.dart';
import 'package:hasad_app/features/lists/domain/repository/lists_repo.dart';
import 'package:hasad_app/features/lists/domain/use_cases/get_cities_list_usecase.dart';
import 'package:hasad_app/features/lists/domain/use_cases/get_districts_list_usecase.dart';
import 'package:hasad_app/features/lists/domain/use_cases/get_list_by_endpoint_usecase.dart';
import 'package:hasad_app/features/lists/presentation/controller/cubit/lists_cubit.dart';
import 'package:hasad_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:hasad_app/features/profile/data/network/profile_api.dart';
import 'package:hasad_app/features/profile/data/repository/profile_repo_impl.dart';
import 'package:hasad_app/features/profile/domain/repository/profile_repo.dart';
import 'package:hasad_app/features/profile/domain/use_cases/edit_profile_usecase.dart';
import 'package:hasad_app/features/profile/domain/use_cases/get_profile_usecase.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/features/requests/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/requests/data/network/request_api.dart';
import 'package:hasad_app/features/requests/data/repository/repo_impl.dart';
import 'package:hasad_app/features/requests/domain/repository/repo.dart';
import 'package:hasad_app/features/requests/domain/use_cases/add_request_usecase.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';

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
  initAddRequest();
  iniLists();
  iniCategories();
  iniProfile();
  iniDirectSellingList();
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

initAddRequest() async {
  //cubit
  if (!GetIt.I.isRegistered<AddRequestCubit>()) {
    sl.registerFactory<AddRequestCubit>(() => AddRequestCubit(sl.call()));
  }
  //app service client instance
  if (!GetIt.I.isRegistered<RequestAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<RequestAppServiceClient>(() => RequestAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<RequestsRepo>()) {
    sl.registerLazySingleton<RequestsRepo>(() => RequestsRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<RequestsRemoteDataSource>()) {
    sl.registerLazySingleton<RequestsRemoteDataSource>(
        () => RequestsRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<AddRequestUseCase>()) {
    sl.registerLazySingleton<AddRequestUseCase>(() => AddRequestUseCase(sl.call()));
  }
}

iniLists() async {
  //cubit
  if (!GetIt.I.isRegistered<ListsCubit>()) {
    sl.registerFactory<ListsCubit>(() => ListsCubit(sl.call(), sl.call(), sl.call()));
  }
  //app service client instance
  if (!GetIt.I.isRegistered<ListsAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<ListsAppServiceClient>(() => ListsAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<ListsRepository>()) {
    sl.registerLazySingleton<ListsRepository>(() => ListsRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<ListsRemoteDataSource>()) {
    sl.registerLazySingleton<ListsRemoteDataSource>(() => ListsRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetCitiesListUseCase>()) {
    sl.registerLazySingleton<GetCitiesListUseCase>(() => GetCitiesListUseCase(sl.call()));
  }

  if (!GetIt.I.isRegistered<GetDistrictsListUseCase>()) {
    sl.registerLazySingleton<GetDistrictsListUseCase>(() => GetDistrictsListUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetListByEndPointUseCase>()) {
    sl.registerLazySingleton<GetListByEndPointUseCase>(() => GetListByEndPointUseCase(sl.call()));
  }
}

iniCategories() async {
  //cubit
  if (!GetIt.I.isRegistered<CategoriesCubit>()) {
    sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(sl.call(), sl.call()));
  }
  //app service client instance
  if (!GetIt.I.isRegistered<CategoriesAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<CategoriesAppServiceClient>(() => CategoriesAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<CategoriesRepository>()) {
    sl.registerLazySingleton<CategoriesRepository>(() => CategoriesRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<CategoriesRemoteDataSource>()) {
    sl.registerLazySingleton<CategoriesRemoteDataSource>(
        () => CategoriesRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetCategoriesUseCase>()) {
    sl.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(sl.call()));
  }

  if (!GetIt.I.isRegistered<GetCategoriesTypesUseCase>()) {
    sl.registerLazySingleton<GetCategoriesTypesUseCase>(() => GetCategoriesTypesUseCase(sl.call()));
  }
}

iniProfile() async {
  //cubit
  if (!GetIt.I.isRegistered<ProfileCubit>()) {
    sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl.call(), sl.call()));
  }
  //app service client instance
  if (!GetIt.I.isRegistered<ProfileAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<ProfileAppServiceClient>(() => ProfileAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<ProfileRepository>()) {
    sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<ProfileRemoteDataSource>()) {
    sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetProfileUseCase>()) {
    sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl.call()));
  }

  if (!GetIt.I.isRegistered<EditProfileUseCase>()) {
    sl.registerLazySingleton<EditProfileUseCase>(() => EditProfileUseCase(sl.call()));
  }
}

iniDirectSellingList() async {
  //cubit
  if (!GetIt.I.isRegistered<DirectSellingListCubit>()) {
    sl.registerFactory<DirectSellingListCubit>(() => DirectSellingListCubit(sl.call()));
  }

  //app service client instance
  if (!GetIt.I.isRegistered<DirectSellingListAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<DirectSellingListAppServiceClient>(
        () => DirectSellingListAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<DirectSellingListRepository>()) {
    sl.registerLazySingleton<DirectSellingListRepository>(
        () => DirectSellingListRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<DirectSellingListRemoteDataSource>()) {
    sl.registerLazySingleton<DirectSellingListRemoteDataSource>(
        () => DirectSellingListRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetDirectSellingListUseCase>()) {
    sl.registerLazySingleton<GetDirectSellingListUseCase>(
        () => GetDirectSellingListUseCase(sl.call()));
  }
}
