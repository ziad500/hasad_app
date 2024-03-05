import 'package:hasad_app/core/network_info.dart';
import 'package:hasad_app/features/auth/domain/usecase/request_change_password_usecase.dart';
import 'package:hasad_app/features/auth/domain/usecase/resend_signup_code_usecase.dart';
import 'package:hasad_app/features/auth/domain/usecase/verify_signup_code_usecase.dart';
import 'package:hasad_app/features/auth/presentation/controller/signup/user/sign_up_cubit.dart';
import 'package:hasad_app/features/bidding/all/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/bidding/all/data/network/bidding_list_api.dart';
import 'package:hasad_app/features/bidding/all/data/repository/repo_impl.dart';
import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/buy_order_after_win_usecase.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/confirm_order_usecase.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/get_bidding_list_usecase.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/get_bidding_orders_usecase.dart';
import 'package:hasad_app/features/bidding/all/domain/use_cases/get_my_bidding_list_usecase.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/cubit/bidding_list_dart_cubit.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/my_bidding_list/cubit/my_bidding_list_cubit.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/orders/cubit/bidding_orders_cubit.dart';
import 'package:hasad_app/features/bidding/details/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/bidding/details/data/network/bidding_details_api.dart';
import 'package:hasad_app/features/bidding/details/data/repository/repo_impl.dart';
import 'package:hasad_app/features/bidding/details/domain/repository/repo.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/bid_usecase.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/buy_bidding_advertisement_usecase.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/get_bidding_details_usecase.dart';
import 'package:hasad_app/features/bidding/details/domain/use_cases/pay_insurance_usecase.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/features/categories/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/categories/data/network/categories_api.dart';
import 'package:hasad_app/features/categories/data/repository/repo_impl.dart';
import 'package:hasad_app/features/categories/domain/repository/repo.dart';
import 'package:hasad_app/features/categories/domain/use_cases/get_categories_types_usecase.dart';
import 'package:hasad_app/features/categories/domain/use_cases/get_categories_usecase.dart';
import 'package:hasad_app/features/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:hasad_app/features/chats/core/di.dart';
import 'package:hasad_app/features/direct_selling/all/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/direct_selling_list_api.dart';
import 'package:hasad_app/features/direct_selling/all/data/repository/repo_impl.dart';
import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_direct_selling_list_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_direct_selling_orders_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/domain/use_cases/get_my_direct_selling_list_usecase.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/cubit/direct_selling_list_dart_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/my_direct_selling_list/cubit/my_direct_selling_list_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/features/direct_selling/details/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/direct_selling/details/data/network/direct_selling_details_api.dart';
import 'package:hasad_app/features/direct_selling/details/data/repository/repo_impl.dart';
import 'package:hasad_app/features/direct_selling/details/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/details/domain/use_cases/buy_direct_selling_usecase.dart';
import 'package:hasad_app/features/direct_selling/details/domain/use_cases/get_direct_selling_details_usecase.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/features/favorites/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/favorites/data/network/fav_api.dart';
import 'package:hasad_app/features/favorites/data/repository/repo_impl.dart';
import 'package:hasad_app/features/favorites/domain/repository/repo.dart';
import 'package:hasad_app/features/favorites/domain/use_cases/add_to_favorites_usecase.dart';
import 'package:hasad_app/features/favorites/domain/use_cases/get_favorites_usecase.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';
import 'package:hasad_app/features/invoice/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/invoice/data/network/invoice_api.dart';
import 'package:hasad_app/features/invoice/data/repository/repo_impl.dart';
import 'package:hasad_app/features/invoice/domain/repository/repo.dart';
import 'package:hasad_app/features/invoice/domain/use_cases/bidding_invoice_usecase.dart';
import 'package:hasad_app/features/invoice/domain/use_cases/direct_selling_invoice_usecase.dart';
import 'package:hasad_app/features/invoice/presentation/controller/cubit/invoice_cubit.dart';
import 'package:hasad_app/features/lists/data/data_source/lists_data_source.dart';
import 'package:hasad_app/features/lists/data/network/lists_api.dart';
import 'package:hasad_app/features/lists/data/repository/lists_repo_impl.dart';
import 'package:hasad_app/features/lists/domain/repository/lists_repo.dart';
import 'package:hasad_app/features/lists/domain/use_cases/get_cities_list_usecase.dart';
import 'package:hasad_app/features/lists/domain/use_cases/get_districts_list_usecase.dart';
import 'package:hasad_app/features/lists/domain/use_cases/get_list_by_endpoint_usecase.dart';
import 'package:hasad_app/features/lists/presentation/controller/cubit/lists_cubit.dart';
import 'package:hasad_app/features/notifications/data/data_source/notifications_data_source.dart';
import 'package:hasad_app/features/notifications/data/network/notifications_api.dart';
import 'package:hasad_app/features/notifications/data/repository/notifications_repo_impl.dart';
import 'package:hasad_app/features/notifications/domain/repository/notifications_repo.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/delete_device_fcm_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/delete_notification_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/get_notification_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/has_un_read_notifications_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/read_notification_usecase.dart';
import 'package:hasad_app/features/notifications/presentation/controller/notifications_cubit.dart';
import 'package:hasad_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:hasad_app/features/profile/data/network/profile_api.dart';
import 'package:hasad_app/features/profile/data/repository/profile_repo_impl.dart';
import 'package:hasad_app/features/profile/domain/repository/profile_repo.dart';
import 'package:hasad_app/features/profile/domain/use_cases/change_password_usecase.dart';
import 'package:hasad_app/features/profile/domain/use_cases/edit_profile_usecase.dart';
import 'package:hasad_app/features/profile/domain/use_cases/get_profile_usecase.dart';
import 'package:hasad_app/features/profile/presentation/controller/change_password/change_password_cubit.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/features/requests/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/requests/data/network/request_api.dart';
import 'package:hasad_app/features/requests/data/repository/repo_impl.dart';
import 'package:hasad_app/features/requests/domain/repository/repo.dart';
import 'package:hasad_app/features/requests/domain/use_cases/add_request_usecase.dart';
import 'package:hasad_app/features/requests/domain/use_cases/edit_request_usecase.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/features/wallet/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/wallet/data/network/wallet_api.dart';
import 'package:hasad_app/features/wallet/data/repository/repo_impl.dart';
import 'package:hasad_app/features/wallet/domain/repository/repo.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/bank_recharge_usecase.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/collect_money_usecase.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/get_payment_link_usecase.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/stc_recharge_usecase.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'dio_factory.dart';
import '../features/auth/data/data_source.dart/auth_remote_data_source.dart';
import '../features/auth/data/network/auth_app_api.dart';
import '../features/auth/data/repository/auth_repo_impl.dart';
import '../features/auth/domain/Repository/auth_repo.dart';
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
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  iniLogin();
  iniForgetPassword();
  initAddRequest();
  iniLists();
  iniCategories();
  iniProfile();
  iniDirectSellingList();
  iniDirectSellingDetails();
  iniBiddingList();
  iniBiddingDetails();
  initChangePassword();
  iniFavoritesList();
  iniInvoice();
  initChatsModule();
  iniWallet();
  initNotifications();
}

iniLogin() async {
  //cubit
  if (!GetIt.I.isRegistered<LoginCubit>()) {
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl.call()));
  }
  if (!GetIt.I.isRegistered<UserSignUpCubit>()) {
    sl.registerFactory<UserSignUpCubit>(() => UserSignUpCubit(sl.call(), sl.call(), sl.call()));
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
  if (!GetIt.I.isRegistered<VerifySignupOtpUseCase>()) {
    sl.registerLazySingleton<VerifySignupOtpUseCase>(() => VerifySignupOtpUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<ResendSignupCodeUseCase>()) {
    sl.registerLazySingleton<ResendSignupCodeUseCase>(() => ResendSignupCodeUseCase(sl.call()));
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
    sl.registerFactory<AddRequestCubit>(() => AddRequestCubit(sl.call(), sl.call()));
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
  if (!GetIt.I.isRegistered<EditRequestUseCase>()) {
    sl.registerLazySingleton<EditRequestUseCase>(() => EditRequestUseCase(sl.call()));
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
    sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl.call(), sl.call(), sl.call()));
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
  if (!GetIt.I.isRegistered<ChangePasswordUseCase>()) {
    sl.registerLazySingleton<ChangePasswordUseCase>(() => ChangePasswordUseCase(sl.call()));
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
  if (!GetIt.I.isRegistered<MyDirectSellingListCubit>()) {
    sl.registerFactory<MyDirectSellingListCubit>(() => MyDirectSellingListCubit(sl.call()));
  }
  if (!GetIt.I.isRegistered<DirectSellingOrdersCubit>()) {
    sl.registerFactory<DirectSellingOrdersCubit>(
        () => DirectSellingOrdersCubit(sl.call(), sl.call()));
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
  if (!GetIt.I.isRegistered<GetMyDirectSellingListUseCase>()) {
    sl.registerLazySingleton<GetMyDirectSellingListUseCase>(
        () => GetMyDirectSellingListUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetDirectSellingOrdersListUseCase>()) {
    sl.registerLazySingleton<GetDirectSellingOrdersListUseCase>(
        () => GetDirectSellingOrdersListUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<ConfirmOrderUseCase>()) {
    sl.registerLazySingleton<ConfirmOrderUseCase>(() => ConfirmOrderUseCase(sl.call()));
  }
}

iniDirectSellingDetails() async {
  //cubit
  if (!GetIt.I.isRegistered<DirectSellingDetailsCubit>()) {
    sl.registerFactory<DirectSellingDetailsCubit>(
        () => DirectSellingDetailsCubit(sl.call(), sl.call()));
  }

  //app service client instance
  if (!GetIt.I.isRegistered<DirectSellingDetailsAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<DirectSellingDetailsAppServiceClient>(
        () => DirectSellingDetailsAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<DirectSellingDetailsRepository>()) {
    sl.registerLazySingleton<DirectSellingDetailsRepository>(
        () => DirectSellingDetailsRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<DirectSellingDetailsRemoteDataSource>()) {
    sl.registerLazySingleton<DirectSellingDetailsRemoteDataSource>(
        () => DirectSellingDetailsRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetDirectSellingDetailsUseCase>()) {
    sl.registerLazySingleton<GetDirectSellingDetailsUseCase>(
        () => GetDirectSellingDetailsUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<BuyDirectSellingUseCase>()) {
    sl.registerLazySingleton<BuyDirectSellingUseCase>(() => BuyDirectSellingUseCase(sl.call()));
  }
}

iniBiddingList() async {
  //cubit
  if (!GetIt.I.isRegistered<BiddingListCubit>()) {
    sl.registerFactory<BiddingListCubit>(() => BiddingListCubit(sl.call()));
  }
  if (!GetIt.I.isRegistered<MyBiddingListCubit>()) {
    sl.registerFactory<MyBiddingListCubit>(() => MyBiddingListCubit(sl.call()));
  }
  if (!GetIt.I.isRegistered<BiddingOrdersCubit>()) {
    sl.registerFactory<BiddingOrdersCubit>(
        () => BiddingOrdersCubit(sl.call(), sl.call(), sl.call()));
  }

  //app service client instance
  if (!GetIt.I.isRegistered<BiddingListAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<BiddingListAppServiceClient>(() => BiddingListAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<BiddingListRepository>()) {
    sl.registerLazySingleton<BiddingListRepository>(() => BiddingListRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<BiddingListRemoteDataSource>()) {
    sl.registerLazySingleton<BiddingListRemoteDataSource>(
        () => BiddingListRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetBiddingListUseCase>()) {
    sl.registerLazySingleton<GetBiddingListUseCase>(() => GetBiddingListUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetMyBiddingListUseCase>()) {
    sl.registerLazySingleton<GetMyBiddingListUseCase>(() => GetMyBiddingListUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetBiddingOrdersListUseCase>()) {
    sl.registerLazySingleton<GetBiddingOrdersListUseCase>(
        () => GetBiddingOrdersListUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<BuyOrderAfterWinOrderUseCase>()) {
    sl.registerLazySingleton<BuyOrderAfterWinOrderUseCase>(
        () => BuyOrderAfterWinOrderUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<ConfirmOrderUseCase>()) {
    sl.registerLazySingleton<ConfirmOrderUseCase>(() => ConfirmOrderUseCase(sl.call()));
  }
}

iniBiddingDetails() async {
  //cubit
  if (!GetIt.I.isRegistered<BiddingDetailsCubit>()) {
    sl.registerFactory<BiddingDetailsCubit>(
        () => BiddingDetailsCubit(sl.call(), sl.call(), sl.call(), sl.call()));
  }

  //app service client instance
  if (!GetIt.I.isRegistered<BiddingDetailsAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<BiddingDetailsAppServiceClient>(
        () => BiddingDetailsAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<BiddingDetailsRepository>()) {
    sl.registerLazySingleton<BiddingDetailsRepository>(
        () => BiddingDetailsRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<BiddingDetailsRemoteDataSource>()) {
    sl.registerLazySingleton<BiddingDetailsRemoteDataSource>(
        () => BiddingDetailsRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetBiddingDetailsUseCase>()) {
    sl.registerLazySingleton<GetBiddingDetailsUseCase>(() => GetBiddingDetailsUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<BuyBiddingAdverticseUseCase>()) {
    sl.registerLazySingleton<BuyBiddingAdverticseUseCase>(
        () => BuyBiddingAdverticseUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<BidBiddingAdverticseUseCase>()) {
    sl.registerLazySingleton<BidBiddingAdverticseUseCase>(
        () => BidBiddingAdverticseUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<PayInsuranceBiddingAdverticseUseCase>()) {
    sl.registerLazySingleton<PayInsuranceBiddingAdverticseUseCase>(
        () => PayInsuranceBiddingAdverticseUseCase(sl.call()));
  }
}

initChangePassword() async {
  //cubit
  if (!GetIt.I.isRegistered<ChangePasswordCubit>()) {
    sl.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(sl.call()));
  }
  //usecase
  if (!GetIt.I.isRegistered<ChangePasswordUseCase>()) {
    sl.registerLazySingleton<ChangePasswordUseCase>(() => ChangePasswordUseCase(sl.call()));
  }
}

iniFavoritesList() async {
  //cubit

  if (!GetIt.I.isRegistered<FavoritesCubit>()) {
    sl.registerFactory<FavoritesCubit>(() => FavoritesCubit(sl.call(), sl.call()));
  }

  //app service client instance
  if (!GetIt.I.isRegistered<FavoritesAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<FavoritesAppServiceClient>(() => FavoritesAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<FavoritesRepository>()) {
    sl.registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<FavoritesRemoteDataSource>()) {
    sl.registerLazySingleton<FavoritesRemoteDataSource>(
        () => FavoritesRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetFavoritesListUseCase>()) {
    sl.registerLazySingleton<GetFavoritesListUseCase>(() => GetFavoritesListUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<AddToFavoritesUseCase>()) {
    sl.registerLazySingleton<AddToFavoritesUseCase>(() => AddToFavoritesUseCase(sl.call()));
  }
}

iniInvoice() async {
  //cubit

  if (!GetIt.I.isRegistered<InvoiceCubit>()) {
    sl.registerFactory<InvoiceCubit>(() => InvoiceCubit(sl.call(), sl.call()));
  }

  //app service client instance
  if (!GetIt.I.isRegistered<InvoiceAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<InvoiceAppServiceClient>(() => InvoiceAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<InvoiceRepository>()) {
    sl.registerLazySingleton<InvoiceRepository>(() => InvoiceRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<InvoiceRemoteDataSource>()) {
    sl.registerLazySingleton<InvoiceRemoteDataSource>(() => InvoiceRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetDirectSellingInvoiceUseCase>()) {
    sl.registerLazySingleton<GetDirectSellingInvoiceUseCase>(
        () => GetDirectSellingInvoiceUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetBiddingInvoiceUseCase>()) {
    sl.registerLazySingleton<GetBiddingInvoiceUseCase>(() => GetBiddingInvoiceUseCase(sl.call()));
  }
}

iniWallet() async {
  //cubit

  if (!GetIt.I.isRegistered<WalletCubit>()) {
    sl.registerFactory<WalletCubit>(() => WalletCubit(sl.call(), sl.call(), sl.call(), sl.call()));
  }

  //app service client instance
  if (!GetIt.I.isRegistered<WalletAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<WalletAppServiceClient>(() => WalletAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<WalletRepo>()) {
    sl.registerLazySingleton<WalletRepo>(() => WalletRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<WalletRemoteDataSource>()) {
    sl.registerLazySingleton<WalletRemoteDataSource>(() => WalletRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<BankRechargeUseCase>()) {
    sl.registerLazySingleton<BankRechargeUseCase>(() => BankRechargeUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<StcRechargeUseCase>()) {
    sl.registerLazySingleton<StcRechargeUseCase>(() => StcRechargeUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetPaymentLinkUseCase>()) {
    sl.registerLazySingleton<GetPaymentLinkUseCase>(() => GetPaymentLinkUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<CollectMoneyUseCase>()) {
    sl.registerLazySingleton<CollectMoneyUseCase>(() => CollectMoneyUseCase(sl.call()));
  }
}

initNotifications() async {
  //cubit
  if (!GetIt.I.isRegistered<NotificationsCubit>()) {
    sl.registerFactory<NotificationsCubit>(
        () => NotificationsCubit(sl.call(), sl.call(), sl.call(), sl.call(), sl.call()));
  }
  //app service client instance
  if (!GetIt.I.isRegistered<NotificationsAppServiceClient>()) {
    Dio dio = await sl<DioFactory>().getDio();

    sl.registerLazySingleton<NotificationsAppServiceClient>(
        () => NotificationsAppServiceClient(dio));
  }

  //repository instance
  if (!GetIt.I.isRegistered<NotificationsRepository>()) {
    sl.registerLazySingleton<NotificationsRepository>(() => NotificationsRepositoryImpl(sl.call()));
  }

  //remote data source instance
  if (!GetIt.I.isRegistered<NotificationsRemoteDataSource>()) {
    sl.registerLazySingleton<NotificationsRemoteDataSource>(
        () => NotificationsRemoteDataSourceImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<GetNotificationsUsecase>()) {
    sl.registerLazySingleton<GetNotificationsUsecase>(() => GetNotificationsUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<DeleteNotificationsUsecase>()) {
    sl.registerLazySingleton<DeleteNotificationsUsecase>(
        () => DeleteNotificationsUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<ReadNotificationsUsecase>()) {
    sl.registerLazySingleton<ReadNotificationsUsecase>(() => ReadNotificationsUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<HasUnReadNotificationsUsecase>()) {
    sl.registerLazySingleton<HasUnReadNotificationsUsecase>(
        () => HasUnReadNotificationsUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<DeleteDeviceFcmUsecase>()) {
    sl.registerLazySingleton<DeleteDeviceFcmUsecase>(() => DeleteDeviceFcmUsecase(sl.call()));
  }
}
