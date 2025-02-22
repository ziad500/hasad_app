import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/auth/presentation/screens/sign_up/user/views/main.dart';
import 'package:hasad_app/features/bidding/all/presentation/screens/bidding_list_screen.dart';
import 'package:hasad_app/features/bidding/all/presentation/screens/search_screen.dart';
import 'package:hasad_app/features/bidding/details/presentation/screens/item_details_screen.dart';
import 'package:hasad_app/features/bidding_requests/presentation/screens/bidding_requests_screen.dart';
import 'package:hasad_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/screens/direct_selling_list_screen.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/screens/search_screen.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/screens/item_details_screen.dart';
import 'package:hasad_app/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:hasad_app/features/filter/presentation/screens/filter_screen.dart';
import 'package:hasad_app/features/invoice/presentation/screens/bidding_invoice.dart';
import 'package:hasad_app/features/invoice/presentation/screens/invoice_screen.dart';
import 'package:hasad_app/features/layout/layout.dart';
import 'package:hasad_app/features/my_advertisement/presentation/screens/my_advertisement_screen.dart';
import 'package:hasad_app/features/my_orders/presentation/screens/my_orders_screen.dart';
import 'package:hasad_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:hasad_app/features/payment/presentation/screens/global_payment.dart';
import 'package:hasad_app/features/payment/presentation/screens/payment_screen.dart';
import 'package:hasad_app/features/profile/presentation/screens/about_hasad.dart';
import 'package:hasad_app/features/profile/presentation/screens/edit_profile.dart';
import 'package:hasad_app/features/profile/presentation/screens/terms_conditions.dart';
import 'package:hasad_app/features/requests/presentation/screens/requests_screen.dart';
import 'package:hasad_app/features/sales_order/presentation/screens/sales_orders_screen.dart';
import 'package:hasad_app/features/splash_screen/splash_screen.dart';
import 'package:hasad_app/features/users_search/presentation/screens/qr_code_screen.dart';
import 'package:hasad_app/features/users_search/presentation/screens/user_profile_screen.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/features/wallet/presentation/screens/upload_slip_screen.dart';
import 'package:hasad_app/features/wallet/presentation/screens/wallet_screen.dart';

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
  static const String profileQrCodeScreen = "/profileQrCodeScreen";
  static const String scanQrCodeScreen = "/scanQrCodeScreen";

  static const String directSellingListScreen = "/directSellingListScreen";
  static const String myOrdersScreen = "/MyOrdersScreen";
  static const String salesOrdersScreen = "/salesOrdersScreen";
  static const String biddingRequestsScreen = "/biddingRequestsScreen";

  static const String invoiceRoutes = "/invoiceRoutes";
  static const String biddingInvoiceScreen = "/biddingInvoiceScreen";
  static const String categoriesScreen = "/categoriesScreen";

  static const String myAdvertisementScreen = "/myAdvertisementScreen";
  static const String biddingListScreen = "/biddingListScreen";
  static const String editProfileRoutes = "/editProfileRoutes";
  static const String favoritesRoutes = "/favoritesRoutes";
  static const String walletScreenRoutes = "/WalletScreenRoutes";
  static const String uploadSlipScreen = "/UploadSlipScreen";
  static const String notificationsScreen = "/NotificationsScreen";
  static const String biddingSearchScreen = "/BiddingSearchScreen";
  static const String directSellingSearchScreen = "/directSellingSearchScreen";
  static const String aboutAppRoutes = "/aboutAppRoutes";
  static const String termsAndConditionsScreen = "/termsAndConditionsScreen";
  static const String userProfileScreen = "/userProfileScreen";

  ////////
  ///

  static const String returnPolicyRoutes = "/returnPolicyRoutes";
  static const String supportRoutes = "/supportRoutes";
  static const String appPrivacyRoutes = "/appPrivacyRoutes";
  static const String termsConditionsPolicyRoutes = "/termsConditionsPolicyRoutes";
  static const String paymentRoutes = "/paymentRoutes";
  static const String globalPaymentRoutes = "/globalPaymentRoutes";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.aboutAppRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const AboutApp();
          },
        );
      case Routes.salesOrdersScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SalesOrdersScreen();
          },
        );
      case Routes.biddingRequestsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return BiddingRequestsScreen(
              advertismentId: args?['id'],
            );
          },
        );

      case Routes.profileQrCodeScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return MyQrCode(
              qrData: args?['qrData'] ?? "",
              profileDataModel: args?['profileDataModel'],
            );
          },
        );
      case Routes.userProfileScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return UserProfileScreen(
              userId: args!['userId'],
            );
          },
        );

      case Routes.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return TermsAndConditionsScreen(title: args?['title'] ?? "");
          },
        );
      case Routes.biddingSearchScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const BiddingSearchScreen();
          },
        );
      case Routes.directSellingSearchScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const DirectSellingSearchScreen();
          },
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;

            return CategoriesScreen(type: args?['type']);
          },
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const NotificationsScreen();
          },
        );
      case Routes.uploadSlipScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const UploadSlipScreen();
          },
        );
      case Routes.walletScreenRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return const WalletScreen();
          },
        );
      case Routes.paymentRoutes:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;
            WalletCubit cubit = args!['cubit'] as WalletCubit;
            return BlocProvider.value(
              value: cubit,
              child: PaymentScreen(link: args['url'], value: args['value']),
            );
          },
        );
      case Routes.globalPaymentRoutes:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Map<String, dynamic>?;
            return GlobalPaymentScreen(link: args?['url'], value: args?['value']);
          },
        );
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
            final DirectSellingDataModel? args = settings.arguments as DirectSellingDataModel?;

            return AddRequestScreen(directSellingDataModel: args);
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
            return const SignUpMainScreen();
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
