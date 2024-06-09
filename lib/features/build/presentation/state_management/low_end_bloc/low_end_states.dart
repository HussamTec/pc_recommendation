import 'package:equatable/equatable.dart';

import '../../../domain/entities/build_entity.dart';

abstract class LowEndState extends Equatable {
  const LowEndState();

  @override
  List<Object> get props => [];
}

class LowEndInitial extends LowEndState {}

class LowEndLoading extends LowEndState {}

class LowEndLoaded extends LowEndState {
  final List<BuildEntity> lowEndBuilds;

  const LowEndLoaded(this.lowEndBuilds);

  @override
  List<Object> get props => [lowEndBuilds];
}

class LowEndError extends LowEndState {
  final String message;

  const LowEndError(this.message);

  @override
  List<Object> get props => [message];
}
