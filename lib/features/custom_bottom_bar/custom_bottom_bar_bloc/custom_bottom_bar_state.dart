import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_bottom_bar_state.freezed.dart';

@freezed
class BottomBarState with _$BottomBarState {
  const factory BottomBarState.selected(int index) = SelectedState;
}
