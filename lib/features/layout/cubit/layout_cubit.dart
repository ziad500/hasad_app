import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/main_screen/presentation/screens/bidding_screen.dart';
import 'package:hasad_app/features/chats/presentation/screens/chats_screen.dart';
import 'package:hasad_app/features/direct_selling/main_screen/presentation/screens/home_screen.dart';
import 'package:hasad_app/features/profile/presentation/screens/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  final List<Widget> screens = [
    const BiddingScreen(),
    const HomeScreen(),
    const ChatsScreen(),
    const ProfileScreen()
  ];
  int currentTap = 0;

  // Function to change the currently displayed screen
  void changeScreen(int index) {
    if (currentTap != index) {
      currentTap = index;
      emit(ChengeScreenState());
    }
  }
}
