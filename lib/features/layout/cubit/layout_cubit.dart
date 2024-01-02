import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/presentation/screens/bidding_screen.dart';
import 'package:hasad_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:hasad_app/features/home/home_screen.dart';
import 'package:hasad_app/features/profile/presentation/screens/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  final List<Widget> screens = [
    const BiddingScreen(),
    const HomeScreen(),
    const ChatScreen(),
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
