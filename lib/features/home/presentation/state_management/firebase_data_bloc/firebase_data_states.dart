// presentation/processors/firebase_data_states.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_data_states.freezed.dart';

@freezed
abstract class FirebaseDataSourceState with _$FirebaseDataSourceState {
  const factory FirebaseDataSourceState.initial() = Initial;
  const factory FirebaseDataSourceState.loading() = Loading;
  const factory FirebaseDataSourceState.loaded(List<dynamic>? objectsList) = Loaded;
  const factory FirebaseDataSourceState.error(String message) = Error;
}