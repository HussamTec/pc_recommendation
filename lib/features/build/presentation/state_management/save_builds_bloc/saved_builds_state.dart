part of 'saved_builds_bloc.dart';

abstract class SavedBuildsState extends Equatable {
  const SavedBuildsState();

  @override
  List<Object> get props => [];
}

class SavedBuildsInitial extends SavedBuildsState {}

class SavedBuildsLoaded extends SavedBuildsState {
  final List<BuildEntity> savedBuilds;

  const SavedBuildsLoaded(this.savedBuilds);

  @override
  List<Object> get props => [savedBuilds];
}

class SavedBuildAdded extends SavedBuildsState {
  final String message; // Optional: Add a success message

  const SavedBuildAdded(this.message);

  @override
  List<Object> get props => [message];
}

class SavedBuildError extends SavedBuildsState {
  final String error;

  const SavedBuildError(this.error);

  @override
  List<Object> get props => [error];
}
