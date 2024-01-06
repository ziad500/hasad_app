import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit() : super(ItemDetailsInitial());

  static ItemDetailsCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
