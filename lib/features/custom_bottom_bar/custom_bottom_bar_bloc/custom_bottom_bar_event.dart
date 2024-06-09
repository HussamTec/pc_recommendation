import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_bottom_bar_event.freezed.dart';

@freezed
class BottomBarEvent with _$BottomBarEvent {
  const factory BottomBarEvent.selectIndex(int index) = SelectIndexEvent;
}
