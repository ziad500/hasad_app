import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';
import 'package:hasad_app/features/invoice/domain/use_cases/bidding_invoice_usecase.dart';
import 'package:hasad_app/features/invoice/domain/use_cases/direct_selling_invoice_usecase.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final GetDirectSellingInvoiceUseCase _getDirectSellingInvoiceUseCase;
  final GetBiddingInvoiceUseCase _getBiddingInvoiceUseCase;
  InvoiceCubit(this._getDirectSellingInvoiceUseCase, this._getBiddingInvoiceUseCase)
      : super(InvoiceInitial());
  static InvoiceCubit get(context) => BlocProvider.of(context);
  InvoiceModel? invoiceModel;
  Future<void> getDirectSellingInvoice(String id) async {
    emit(GetDirectSellingLoadingState());
    await _getDirectSellingInvoiceUseCase
        .execude(id)
        .then((value) => value.fold((l) => emit(GetDirectSellingErrorState(l.message)), (r) {
              invoiceModel = r;
              emit(GetDirectSellingSuccessState());
            }));
  }

  Future<void> getBiddingInvoice(String id) async {
    emit(GetBiddingLoadingState());
    await _getBiddingInvoiceUseCase.execude(id).then((value) => value.fold(
        (l) => emit(GetBiddingErrorState(l.message)), (r) => emit(GetBiddingSuccessState())));
  }
}
