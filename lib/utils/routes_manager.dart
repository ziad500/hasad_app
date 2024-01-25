import 'package:hasad_app/features/auth/presentation/screens/sign_up/user/views/user_signup.dart';
import 'package:hasad_app/features/bidding/all/presentation/screens/bidding_list_screen.dart';
import 'package:hasad_app/features/bidding/details/presentation/screens/item_details_screen.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/screens/direct_selling_list_screen.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/screens/item_details_screen.dart';
import 'package:hasad_app/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:hasad_app/features/filter/presentation/screens/filter_screen.dart';
import 'package:hasad_app/features/invoice/presentation/screens/bidding_invoice.dart';
import 'package:hasad_app/features/invoice/presentation/screens/invoice_screen.dart';
import 'package:hasad_app/features/layout/layout.dart';
import 'package:hasad_app/features/my_advertisement/presentation/screens/my_advertisement_screen.dart';
import 'package:hasad_app/features/my_orders/presentation/screens/my_orders_screen.dart';
import 'package:hasad_app/features/profile/presentation/screens/edit_profile.dart';
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
  static const String filterScreen = "/FilterScreenRoutes";
  static const String addRequestScreen = "/AddRequestScreen";
  static const String itemDetailsRoutes = "/itemDetailsRoutes";
  static const String biddingDetailsScreen = "/BiddingDetailsScreen";

  static const String directSellingListScreen = "/directSellingListScreen";
  static const String myOrdersScreen = "/MyOrdersScreen";
  static const String invoiceRoutes = "/invoiceRoutes";
  static const String biddingInvoiceScreen = "/biddingInvoiceScreen";

  static const String myAdvertisementScreen = "/myAdvertisementScreen";
  static const String biddingListScreen = "/biddingListScreen";
  static const String editProfileRoutes = "/editProfileRoutes";
  static const String favoritesRoutes = "/favoritesRoutes";

  ////////

  static const String returnPolicyRoutes = "/returnPolicyRoutes";
  static const String supportRoutes = "/supportRoutes";
  static const String appPrivacyRoutes = "/appPrivacyRoutes";
  static const String termsConditionsPolicyRoutes = "/termsConditionsPolicyRoutes";
  static const String paymentRoutes = "/paymentRoutes";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.biddingInvoiceScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;
            return BiddingInvoiceScreen(id: args!['id'].toString());
          },
        );
      case Routes.invoiceRoutes:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;
            return DirectSellingInvoiceScreen(id: args!['id'].toString());
          },
        );
      case Routes.biddingDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return BiddingDetailsScreen(
              id: args!['id'].toString(),
            );
          },
        );
      case Routes.favoritesRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const FavoritesScreen();
          },
        );
      case Routes.editProfileRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const EditProfileScreen();
          },
        );
      case Routes.itemDetailsRoutes:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return ItemDetailsScreen(
              id: args!['id'].toString(),
            );
          },
        );
      case Routes.filterScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;
            return FilterScreen(
              buttonFunc: args?['buttonFunc'],
            );
          },
        );
      case Routes.directSellingListScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return DirectSellingListScreen(
              categoryName: args?['name'],
              categoryId: args?['id'],
            );
          },
        );
      case Routes.biddingListScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return BiddingListScreen(
              categoryName: args?['name'],
              categoryId: args?['id'],
            );
          },
        );
      case Routes.myOrdersScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const MyOrdersScreen();
          },
        );
      case Routes.myAdvertisementScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const MyAdvertisementScreen();
          },
        );
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
