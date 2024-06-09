part of 'home_search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchTextChanged extends SearchEvent {
  final String text;

  const SearchTextChanged(this.text);

  @override
  List<Object?> get props => [text];
}
