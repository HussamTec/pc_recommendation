import 'package:equatable/equatable.dart';

import '../../../domain/entities/build_entity.dart';

abstract class HighEndState extends Equatable {
  const HighEndState();

  @override
  List<Object> get props => [];
}

class HighEndInitial extends HighEndState {}

class HighEndLoading extends HighEndState {}

class HighEndLoaded extends HighEndState {
  final List<BuildEntity> highEndBuilds;

  const HighEndLoaded(this.highEndBuilds);

  @override
  List<Object> get props => [highEndBuilds];
}

class HighEndError extends HighEndState {
  final String message;

  const HighEndError(this.message);

  @override
  List<Object> get props => [message];
}
