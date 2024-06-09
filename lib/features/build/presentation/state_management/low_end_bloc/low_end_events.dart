import 'package:equatable/equatable.dart';

abstract class LowEndEvent extends Equatable {
  const LowEndEvent();

  @override
  List<Object> get props => [];
}

class FetchLowEndData extends LowEndEvent {}
