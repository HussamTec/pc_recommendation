part of 'saved_builds_bloc.dart';

abstract class SavedBuildsEvent extends Equatable {
  const SavedBuildsEvent();

  @override
  List<Object> get props => [];
}

class AddSavedBuild extends SavedBuildsEvent {
  final BuildEntity buildEntity;

  const AddSavedBuild(this.buildEntity);

  @override
  List<Object> get props => [buildEntity];
}

class LoadSavedBuilds extends SavedBuildsEvent {}

// Add other events as needed (e.g., DeleteSavedBuild)
