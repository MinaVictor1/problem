import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:meta/meta.dart';
import 'package:threemodel/List.dart';

part 'changepage_state.dart';

class ChangepageCubit extends Cubit<ChangepageState> {
  ChangepageCubit() : super(ChangepageInitial());

  static ChangepageCubit get(context) =>
      BlocProvider.of<ChangepageCubit>(context);
  int i = 0;

  Future<void> changePage(PageController controller) async {
    await _loadPageInBackground(i + 1); // Load the next page in the background

    controller.jumpToPage(i);

    Future.delayed(const Duration(seconds: 5), () {
      i++;
      // Check if i exceeds the total number of pages and reset if needed
      if (i >= models.length) {
        i = 0;
      }
      emit(ChangepageForward());
    });
  }

  Future<void> _loadPageInBackground(int index) async {
    if (index < models.length) {
      // Simulate loading in the background
      await Future.delayed(const Duration(seconds: 2));
      print('Page $index loaded in the background.');
      // You can trigger any additional logic here for loading the page.
    }
  }
}
