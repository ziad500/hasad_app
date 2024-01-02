import 'package:hasad_app/features/auth/presentation/screens/sign_up/user/views/user_signup.dart';
import 'package:hasad_app/features/layout/layout.dart';
import 'package:hasad_app/features/requests/presentation/screens/requests_screen.dart';
import 'package:hasad_app/features/splash_screen/splash_screen.dart';

import '../features/auth/presentation/screens/forget_password/view/forget_password_screen.dart';
import '../features/auth/presentation/screens/login/views/login_screen.dart';

import 'package:flutter/material.dart';

class Routes {
  static const String splashRoutes = "/";
  static const String loginRoutes = "/login";
  static const String forgetPassword = "/forgetPassword";
  static const String signUpScreenRoutes = "/signUpScreen";
  static const String homeScreenRoutes = "/homeScreen";
  static const String addRequestScreen = "/AddRequestScreen";
  static const String bigDealsScreenRoutes = "/bigDealsScreenRoutes";
  static const String bestSellingScreenRoutes = "/bestSellingScreenRoutes";
  static const String brandsScreenRoutes = "/brandsScreenRoutes";
  static const String editprofileScreen = "/editprofileScreen";
  static const String productsByCategoryScreen = "/ProductsByCategoryScreen";
  static const String allProductsScreen = "/AllProductsScreen";
  static const String searchScreen = "/SearchScreen";
  static const String productDetailsScreen = "/ProductDetailsScreen";
  static const String favScreen = "/favScreen";
  static const String blogScreen = "/blogScreen";
  static const String ordersScreen = "/ordersScreen";
  static const String ordersDetailsScreen = "/ordersDetailsScreen";
  static const String checkOutScreen = "/checkOutScreen";
  static const String checkOutSuccessScreen = "/checkOutSuccessScreen";
  static const String returnPolicyRoutes = "/returnPolicyRoutes";
  static const String supportRoutes = "/supportRoutes";
  static const String appPrivacyRoutes = "/appPrivacyRoutes";
  static const String termsConditionsPolicyRoutes = "/termsConditionsPolicyRoutes";
  static const String paymentRoutes = "/paymentRoutes";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.addRequestScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const AddRequestScreen();
          },
        );
      case Routes.homeScreenRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const LayoutScreen();
          },
        );
      case Routes.signUpScreenRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const UserSignUp();
          },
        );
      case Routes.loginRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgetPasswordScreen();
          },
        ); /*
           case Routes.codeLoginScreenRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return CodeLoginScreen();
          },
        ); */
      case Routes.splashRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("No data"), // todo move string
        ),
        body: const Center(
          child: Text("No data"),
        ),
      ),
    );
  }
}
