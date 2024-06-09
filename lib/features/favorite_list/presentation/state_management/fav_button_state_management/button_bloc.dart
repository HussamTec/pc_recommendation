import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ButtonSelectionState {
  final List<String> selectedIndices;

  ButtonSelectionState({required this.selectedIndices});

  // Add a copyWith method
  ButtonSelectionState copyWith({
    List<String>? selectedIndices,
  }) {
    return ButtonSelectionState(
      selectedIndices: selectedIndices ?? this.selectedIndices,
    );
  }
}

class FavButtonSelectionCubit extends Cubit<ButtonSelectionState> {
  FavButtonSelectionCubit() : super(ButtonSelectionState(selectedIndices: []));

  Future<List<String>> getFavoritesIds() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    var userId=auth.currentUser!.uid;

    CollectionReference favoritesRef = firestore.collection('user_favorites$userId');

    final snapshot = await favoritesRef.get();
    final ids = snapshot.docs.map((doc) => doc.get('id') as String).toList();
    emit(state.copyWith(selectedIndices: ids));

    return ids;
  }
  void toggleSelection(String indexId) {
    final List<String> newSelection = List.from(state.selectedIndices);
    if (newSelection.contains(indexId)) {
      newSelection.remove(indexId);
    } else {
      newSelection.add(indexId);
    }
    emit(ButtonSelectionState(selectedIndices: newSelection));
  }
}
