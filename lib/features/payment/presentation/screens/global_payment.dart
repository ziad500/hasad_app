import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../common/default/main_layout.dart';

class GlobalPaymentScreen extends StatefulWidget {
  const GlobalPaymentScreen({super.key, this.link, this.value});
  final String? link;
  final String? value;

  @override
  State<GlobalPaymentScreen> createState() => _GlobalPaymentScreenState();
}

class _GlobalPaymentScreenState extends State<GlobalPaymentScreen> {
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
            // Update loading bar.
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
    return LoadingFrame(
      loadingStates: [isLoading ? const LoadingPage() : const SizedBox()],
      child: DefaultScaffold(
        back: true,
        body: WebViewWidget(controller: controller!),
      ),
    );
  }

  String extractPaymentId(String url) {
    Uri uri = Uri.parse(url);
    String paymentId = uri.queryParameters['payment_id'] ?? '';
    return paymentId;
  }
}
