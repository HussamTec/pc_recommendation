import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_bottom_bar_event.dart';
import 'custom_bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(const BottomBarState.selected(2));

  @override
  Stream<BottomBarState> mapEventToState(BottomBarEvent event) async* {
    yield* event.when(
      selectIndex: (index) async* {
        yield BottomBarState.selected(index);
      },
    );
  }
}
