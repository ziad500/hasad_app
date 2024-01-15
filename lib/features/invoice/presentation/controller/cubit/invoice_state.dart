part of 'invoice_cubit.dart';

sealed class InvoiceState {
  const InvoiceState();
}

final class InvoiceInitial extends InvoiceState {}

final class GetDirectSellingLoadingState extends InvoiceState {}

final class GetDirectSellingSuccessState extends InvoiceState {}

final class GetDirectSellingErrorState extends InvoiceState {
  final String error;
  GetDirectSellingErrorState(this.error);
}

final class GetBiddingLoadingState extends InvoiceState {}

final class GetBiddingSuccessState extends InvoiceState {}

final class GetBiddingErrorState extends InvoiceState {
  final String error;
  GetBiddingErrorState(this.error);
}
