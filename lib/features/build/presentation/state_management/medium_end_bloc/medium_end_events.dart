import 'package:equatable/equatable.dart';

abstract class MediumEndEvent extends Equatable {
  const MediumEndEvent();

  @override
  List<Object> get props => [];
}

class FetchMediumEndData extends MediumEndEvent {}
