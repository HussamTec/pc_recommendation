import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/entities/build_entity.dart';
part 'saved_builds_event.dart';
part 'saved_builds_state.dart';

class SavedBuildsBloc extends Bloc<SavedBuildsEvent, SavedBuildsState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  SavedBuildsBloc() : super(SavedBuildsInitial()) {
    on<AddSavedBuild>((event, emit) async {
      try {
        // Optional: Generate a document ID if not provided in the object
        final String docId = event.buildEntity.id;
        await _firestore.collection('saved_builds${FirebaseAuth.instance.currentUser?.uid}').doc(docId).set(event.buildEntity.toMap());
        emit(const SavedBuildAdded('Saved build successfully'));
      } on FirebaseException catch (e) {
        print(e.message);
        emit(SavedBuildError(e.message!));
      } catch (e) {
        emit(SavedBuildError(e.toString())); // Handle other potential errors
      }
    });

    on<LoadSavedBuilds>((event, emit) async {
      try {
        final querySnapshot = await _firestore.collection('saved_builds${FirebaseAuth.instance.currentUser?.uid}').get();
        final savedBuilds = querySnapshot.docs
            .map((doc) => BuildEntity.fromMap(doc.data()))
            .toList();
        emit(SavedBuildsLoaded(savedBuilds));
      } on FirebaseException catch (e) {

        emit(SavedBuildError('${e.message!}here!!!!!!!'));
      } catch (e) {
        print('Here!!!!!!!!!!!!!!!! $e');
        emit(SavedBuildError(e.toString()));
      }
    });
  }
}
