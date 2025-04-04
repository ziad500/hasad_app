import 'package:hasad_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:hasad_app/features/auth/presentation/controller/signup/user/sign_up_cubit.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';
import 'package:hasad_app/features/layout/cubit/layout_cubit.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/main_functions.dart';
import 'utils/language_manager.dart';
import 'utils/routes_manager.dart';
import 'utils/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants.dart';
import 'core/di.dart' as di;
import 'core/network_cubit.dart';

void main() async {
  await APPInit
      .init(); /* 
  print(await FirebaseMessagingService.getToken());
  print(Constants.token); */

  runApp(LanguageManager.easyLocalizationInit(child: MyApp()));
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    if (context.locale.toString() == ARABIC_LOCAL.toString()) {
      Constants.isArabic = true;
    } else {
      Constants.isArabic = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
        BlocProvider(
          create: (context) => di.sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<UserSignUpCubit>(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => di.sl<ProfileCubit>()
            ..getProfileData()
            ..getAppSettings(),
        ),
        BlocProvider(
          create: (context) => di.sl<FavoritesCubit>()..getFavoritesList(),
        ),
      ],
      child: BlocConsumer<InternetCubit, InternetState>(
        buildWhen: (previous, current) => false,
        listener: (context, state) => InternetCubit.get(context).internetListner(context, state),
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360.0, 640.0),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              builder: (context, child) {
                ScreenUtil.init(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
                  child: Theme(
                    data: getApplicationTheme(),
                    child: child!,
                  ),
                );
              },
              navigatorKey: navigatorKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.splashRoutes,
            ),
          );
        },
      ),
    );
  }
}
