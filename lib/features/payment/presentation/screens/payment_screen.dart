import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../common/default/main_layout.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.value, this.link});
  final String? value;
  final String? link;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  WebViewController? controller;
  bool fired = false;
  bool isLoading = true;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress >= 80) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (url.contains("success")) {
              if (fired == false) {
                WalletCubit.get(context).stcRecharge(extractPaymentId(url));
              }
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {
        if (state is StcRechargSuccessState) {
          ProfileCubit.get(context).getProfileData();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => DoneRequestScreen(
                      donePageState: DonePageState.done,
                      title: LocaleKeys.donePayment.tr(),
                      subTitle:
                          "${LocaleKeys.youHaveSuccessfullyPaid.tr()} ${widget.value} ${LocaleKeys.saudiRiyal.tr()}",
                      route: Routes.homeScreenRoutes)),
              (route) => false);
        }
        if (state is StcRechargErrorState) {
          fired = false;

          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        }
        if (state is StcRechargLoadingState) {
          fired = true;
        }
      },
      builder: (context, state) {
        return LoadingFrame(
          loadingStates: [
            (state is StcRechargLoadingState || isLoading) ? const LoadingPage() : const SizedBox()
          ],
          child: DefaultScaffold(
            back: true,
            body: WebViewWidget(controller: controller!),
          ),
        );
      },
    );
  }

  String extractPaymentId(String url) {
    Uri uri = Uri.parse(url);
    String paymentId = uri.queryParameters['payment_id'] ?? '';
    return paymentId;
  }
}
