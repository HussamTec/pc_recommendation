import 'package:equatable/equatable.dart';

abstract class HighEndEvent extends Equatable {
  const HighEndEvent();

  @override
  List<Object> get props => [];
}

class FetchHighEndData extends HighEndEvent {}
