import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (url.contains("Success")) {
              WalletCubit.get(context).stcRecharge();
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DoneRequestScreen(
                      donePageState: DonePageState.done,
                      title: "Payment Successful",
                      subTitle:
                          "You Have Successfully paid ${widget.value} ${LocaleKeys.saudiRiyal.tr()}",
                      route: Routes.homeScreenRoutes)));
        }
        if (state is StcRechargErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return LoadingFrame(
          loadingStates: [state is StcRechargLoadingState ? const LoadingPage() : const SizedBox()],
          child: DefaultScaffold(
            back: true,
            body: WebViewWidget(controller: controller!),
          ),
        );
      },
    );
  }
}
