import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:threemodel/lists/listcontroller.dart';

part 'changecontroller_state.dart';

class ChangecontrollerCubit extends Cubit<ChangecontrollerState> {
  ChangecontrollerCubit() : super(ChangecontrollerInitial());

  void changeController() {
    astController.play();
    unController.play();
    danController.play();
    emit(Changecontroller());
  }
}
