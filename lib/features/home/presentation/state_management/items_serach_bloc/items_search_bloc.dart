import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'items_search_states.dart';
part 'items_search_events.dart';



class ItemsSearchBloc extends Bloc<ItemsSearchEvent, ItemsSearchState> {
  ItemsSearchBloc() : super( SearchInitial()) {
    on<SearchTextChanged>((event, emit) async {
      if (event.text.isEmpty) {
        emit( SearchInitial()); // Reset state on empty text
      } else {
        emit( SearchLoading());

        try {
          final suggestions = _searchLogic(event.text.toLowerCase(),event.collectionName);
          emit(SearchSuccess(await suggestions));
        } catch (e) {
          emit(SearchError(e.toString()));
        }
      }
    });
  }

  Future<List<Map<String, dynamic>>> _searchLogic(String text, String collectionName) async {
    final lowercaseText = text.toLowerCase();
    final firestore = FirebaseFirestore.instance;

    final collection = firestore.collection(collectionName);

    // Retrieve all documents from the collection
    final querySnapshot = await collection.get();

    // Convert all document names to lowercase and filter documents based on the search text
    final suggestions = querySnapshot.docs
        .where((doc) => doc.data()['name'].toLowerCase().contains(lowercaseText))
        .map((doc) => doc.data())
        .toList();
    return suggestions;
  }



}
