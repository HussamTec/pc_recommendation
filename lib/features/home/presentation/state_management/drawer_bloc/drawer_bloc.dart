// drawer_bloc.dart
import 'package:bloc/bloc.dart';


import 'drawer_event.dart';
import 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerClosedState());

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async* {
    if (event is OpenDrawerEvent) {
      yield DrawerOpenState();
    } else if (event is CloseDrawerEvent) {
      yield DrawerClosedState();
    }
  }
}
