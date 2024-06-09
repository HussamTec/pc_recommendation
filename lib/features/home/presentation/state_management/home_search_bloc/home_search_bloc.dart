import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_search_events.dart';
part 'home_search_states.dart';
 const List<String> searchItems = [
  'Motherboards',
  'Case Accessories',
  'Case Fans',
  'Cases',
  'External Storage',
  'Fan Controllers',
  'Graphic Cards',
  'Headphones',
  'Keyboards',
  'Monitors',
  'Mouse Pads',
  'Mouses',
  'News',
  'Operating Systems',
  'Optical Drives',
  'Power Supplies',
  'Processors',
  'Ram',
  'Speakers',
  'Storage',
  'Thermal Pastes',
  'Webcams',
];



class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super( SearchInitial()) {
    on<SearchTextChanged>((event, emit) async {
      if (event.text.isEmpty) {
        emit( SearchInitial()); // Reset state on empty text
      } else {
        emit( SearchLoading());

        try {
          final suggestions = _searchLogic(event.text.toLowerCase());
          emit(SearchSuccess(suggestions));
        } catch (e) {
          emit(SearchError(e.toString()));
        }
      }
    });
  }

  List<String> _searchLogic(String text) {
    final lowercaseText = text.toLowerCase();
    return searchItems.where((item) => item.toLowerCase().startsWith(lowercaseText)).toList();
  }



}
