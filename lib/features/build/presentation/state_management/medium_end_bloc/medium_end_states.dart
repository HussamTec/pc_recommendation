import 'package:equatable/equatable.dart';

import '../../../domain/entities/build_entity.dart';

abstract class MediumEndState extends Equatable {
  const MediumEndState();

  @override
  List<Object> get props => [];
}

class MediumEndInitial extends MediumEndState {}

class MediumEndLoading extends MediumEndState {}

class MediumEndLoaded extends MediumEndState {
  final List<BuildEntity> mediumEndBuilds;

  const MediumEndLoaded(this.mediumEndBuilds);

  @override
  List<Object> get props => [mediumEndBuilds];
}

class MediumEndError extends MediumEndState {
  final String message;

  const MediumEndError(this.message);

  @override
  List<Object> get props => [message];
}
