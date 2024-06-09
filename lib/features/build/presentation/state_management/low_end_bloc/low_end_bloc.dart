import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/build_entity.dart';
import '../../../domain/usecase/build_collection_usecase.dart';
import 'low_end_events.dart';
import 'low_end_states.dart';

class LowEndBloc extends Bloc<LowEndEvent, LowEndState> {
  final GetCollectionData getCollectionData;

  LowEndBloc(this.getCollectionData) : super(LowEndInitial()) {
    on<FetchLowEndData>(_onFetchLowEndData);
  }

  void _onFetchLowEndData(FetchLowEndData event, Emitter<LowEndState> emit) async {
    emit(LowEndLoading());
    try {
      await emit.forEach<List<BuildEntity>>(
        getCollectionData('lowEnd'),
        onData: (lowEndBuilds) => LowEndLoaded(lowEndBuilds),
        onError: (_, __) => const LowEndError('Failed to fetch data'),
      );
    } catch (e) {
      emit(LowEndError(e.toString()));
    }
  }
}
