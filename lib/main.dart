import 'package:hasad_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:hasad_app/features/auth/presentation/controller/signup/user/sign_up_cubit.dart';
import 'package:hasad_app/features/layout/cubit/layout_cubit.dart';
import 'package:device_preview/device_preview.dart';

import 'utils/bloc_observer.dart';
import 'utils/cache_helper.dart';
import 'utils/cache_keys.dart';
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
  //01032226321

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await di.initAppModule();
  Constants.token = CacheHelper.getData(key: CacheKeys.token) ?? "";
  Constants.refreshToken = CacheHelper.getData(key: CacheKeys.refreshToken) ?? "";
  Constants.userId = CacheHelper.getData(key: CacheKeys.userId) ?? "";
  print(Constants.token);
  runApp(EasyLocalization(
    supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
    path: ASSET_PATH_LOCALIZATION,
    saveLocale: true,
    startLocale: ARABIC_LOCAL,
    fallbackLocale: ENGLISH_LOCAL,
    child: DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  ));
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
                return Theme(
                  data: getApplicationTheme(),
                  child: child!,
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
