part of 'items_search_bloc.dart';


@immutable
abstract class ItemsSearchEvent extends Equatable {
  const ItemsSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchTextChanged extends ItemsSearchEvent {
  final String text;
  final String collectionName;

  const SearchTextChanged(this.text,this.collectionName);

  @override
  List<Object?> get props => [text,collectionName];
}
