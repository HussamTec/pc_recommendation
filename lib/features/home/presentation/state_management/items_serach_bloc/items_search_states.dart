part of 'items_search_bloc.dart';

@immutable
abstract class ItemsSearchState extends Equatable {
  const ItemsSearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends ItemsSearchState {}

class SearchLoading extends ItemsSearchState {}

class SearchSuccess extends ItemsSearchState {
  final List<Map<String, dynamic>> suggestions;

  const SearchSuccess(this.suggestions);

  @override
  List<Object?> get props => [suggestions];
}

class SearchError extends ItemsSearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
